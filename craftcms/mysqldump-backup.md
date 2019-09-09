# CraftCMS mysqldump backup fix

Craft 3 requires mysqldump to back up the database. Some plugins will do this automatically, even if you have auto backups turned off. For example, this occurs if you are running Craft through MAMP. I also had a random issue where it wasn't reading the password for some reason using the built-in command. Luckily, you can override the backup command.

https://craftcms.com/support/database-backups-in-craft-3-with-mamp
https://github.com/craftcms/cms/blob/develop/src/config/GeneralConfig.php#L85-L105

```
BACKUP_COMMAND="path/to/mysqldump --host {server} --port {port} -u {user} -p{password} --add-drop-table --comments --create-options --dump-date --no-autocommit --routines --set-charset --triggers --single-transaction --no-data --result-file=\"{file}\" {database} && mysqldump --host {server} --port {port} -u {user} -p{password} --add-drop-table --comments --create-options --dump-date --no-autocommit --routines --set-charset --triggers --no-create-info --ignore-table={database}.assetindexdata --ignore-table={database}.assettransformindex --ignore-table={database}.cache --ignore-table={database}.sessions --ignore-table={database}.templatecaches --ignore-table={database}.templatecachecriteria --ignore-table={database}.templatecacheelements {database} >> \"{file}\""

RESTORE_COMMAND="path/to/mysql --host {server} --port {port} -u {user} -p1ea48c6eef04cdbc {database} < \"{file}\""
```
