# cron

-   Minute(0-59) Hour(0-24) Day_of_month(1-31) Month(1-12) Day_of_week(0-6) Command_to_execute
-   Cron editor: https://crontab.guru/
-   `crontab -l`: display the user's cron jobs
-   `crontab -e`: edit the user's cron jobs
-   logs to syslog (`/var/log/syslog`) by default: `grep CRON /var/log/syslog`
