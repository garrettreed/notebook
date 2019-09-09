# Exploring a docker container

In order to get path for mounting storage

```
# find ID of your running container:
docker ps

# create image (snapshot) from container filesystem
docker commit 12345678904b5 mysnapshot

# explore this filesystem using bash (for example)
docker run -t -i mysnapshot /bin/bash
This way, you can evaluate filesystem of the running container in the precise time moment. Container is still running, no future changes are included.

You can later delete snapshot using (filesystem of the running container is not affected!):

docker rmi mysnapshot
```
