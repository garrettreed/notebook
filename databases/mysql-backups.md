# MySQL Backups

Don't worry about logrotate for this, since we'll need a new file per backup. Just use find. Do this with cron.

Deletes backups older than two weeks:

```
mysqldump -u db_user -pdb_pass --databases db_name | gzip > /var/log/project_name/`date '+%m-%d-%Y'`.sql.gz && find /var/log/ws-chamber -mtime +14 -type f -delete
```

Create a log folder. If created in `/var/log`, make sure the user you'll run cron as has permissions to read/write here. Test by creating and reading a file.

Add a cron entry for mysqldump. This will run every night at midnight:

```
0 0 * * * username /path/to/backup/command
```
