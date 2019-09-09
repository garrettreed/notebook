# MySQL Backups

Don't worry about logrotate for this, since we'll need a new file per backup. Just use find. Do this with cron.

Deletes backups older than two weeks:

`mysqldump -u forge -pS0BFHZ9o5mBpNCmeajbH --databases wschamber_www | gzip > /var/log/ws-chamber/`date '+%m-%d-%Y'`.sql.gz && find /var/log/ws-chamber -mtime +14 -type f -delete`

Create a log folder. If created in `/var/log`, make sure the user you'll run cron as has permissions to read/write. Test by creating and reading a file.

Create new conf in `/etc/logratate.d`. Example:

Add a cron entry for mysqldump. This will run every night at midnight:

```
0 0 * * * forge mysqldump -u dbuser -pthepassword --databases db_name | gzip > /var/log/ws-chamber/`date '+%m-%d-%Y'`.sql.gz
```
