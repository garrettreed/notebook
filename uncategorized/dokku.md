# Dokku

## Notes

-   Sometimes the deploy doesn't clean up itself. If there's a spike in disk usage, run `dokku cleanup`
-   The dokku cleanup command should run this, but you can try docker's command to kill dead containers with `docker system prune`
-   List stopped docker containers with `docker ps -a --filter="status=exited"`
-   Don't run this! ~`docker rm $(docker ps -a -q)`~
    -   That removes all stopped containers, including those just for storage. That'll remove mariadb dokku stuff
-   Sometimes a deploy doesn't correctly stop a docker process and remove its container. You can usually tell by running `docker ps -a`. Bad containers will have a long number string attached (maybe utc stamp?). Confirm that a good version of this process is running then stop it with `docker stop processhash`. It probably has an untagged image attached: `docker images | grep "^<none>"`. Either way, run `docker images` and find the one attached to the process. If it's not in use by any other process, delete it with `docker rmi imagehash`
-   We have similar issues as this: https://github.com/dokku/dokku/issues/1988 Need to read more into layers and dockerfile deployments

## App setup

1. Create new digitalocean droplet
    - At least 512mb per 2 databases
    - Ubuntu latest LTS
    - Install dokku according to their instructions
2. Create A record for dokku.SITENAME.com pointing to new server IP
3. Go to dokku.SITENAME.com/dokku to set up host and ssh keys
4. Update droplet
    - `sudo apt-get update`
    - `sudo apt-get full-upgrade`
5. Set up swapfile
    - `sudo fallocate -l 1G /swapfile`
    - `sudo chmod 600 /swapfile`
    - `sudo mkswap /swapfile`
    - `sudo swapon /swapfile`
    - `sudo swapon --show`
    - `free -h`
    - `echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab`
6. Install plugins
    - `sudo dokku plugin:install https://github.com/dokku/dokku-letsencrypt.git`
    - `sudo dokku plugin:install https://github.com/dokku/dokku-mariadb.git mariadb`
7. Create the apps
    - `dokku apps:create APP_NAME`
    - `dokku mariadb:create APP_NAME`
    - `dokku mariadb:link APP_NAME APP_NAME`
    - `dokku config:set --no-restart APP_NAME DOKKU_LETSENCRYPT_EMAIL=hello@airtype.com`
8. Deploy the apps (from host)
    - `git remote add dokku-ENV dokku@dokku.SITENAME.com:APP_NAME-ENV`
    - `git push dokku-ENV CURRENT_BRANCH:master`
9. Add domains
    - `dokku domains:add APP_NAME DOMAIN`
    - Set up DNS records for these domains
10. Set up SSl
    - When the domains are resolving and apps are up
    - `dokku letsencrypt APP_NAME`
    - If you get a permissions error, `chmod 777` the file and containing folder.
11. Set upload size if CMS
    - `echo 'client_max_body_size 50M;' > /home/dokku/APP_NAME/nginx.conf.d/upload.conf`
    - `chown dokku:dokku /home/dokku/APP_NAME/nginx.conf.d/upload.conf`
    - `service nginx reload`

## Adding Storage

Need the location of the assets inside the docker container.
For example, the apache2 buildpacke adds your app to `/app`.
Example mount: `/dokku-storage/lairdframe:/app/public/uploads`

1. Find path to your app with `dokku enter APP_NAME` and `pwd`
2. Create dokku storage location if it doesn't exist: `mkdir /dokku-storage`
3. Create app storage container: `mkdir /dokku-storage/APP_NAME`
4. Mount it: `dokku storage:mount APP_NAME /dokku-storage/APP_NAME:PATH_TO_ASSETS`
