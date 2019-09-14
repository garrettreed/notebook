# Check Server Disk Usage

-   Listing of all items in a directory and their sizes: `du -sh *`
-   Check for things taking up disk space: `sudo du -cha --max-depth=1 / | grep -E "M|G"`
