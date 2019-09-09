# CraftCMS Content Migration Deploys

Possible best solution: https://github.com/Firstborn/Craft-Migration-Manager
https://docs.craftcms.com/v3/extend/migrations.html

Dealing with a database-driven cms is not easy because only the frontend of the app is stateless.
After it's live, if the site is highly trafficked and has a lot of assets and records, the easiest way to make cms changes is to build them point-and-click locally and then rebuild them live. That's because you can pull everything before starting development, make changes, and get ready to push up, but have to pull one more time. During that pull, if the prod site has changed, it can break your build. It's either this or planned downtime for the site.

It should be possible to automate this if you can do the following:

-   Don't allow any environment-specific data in the DB. Keep all of that in environment configuration
-   Before db-altering development begins, put a freeze on the live CMS so that no changes will occur. If the public can affect the db, put the site in maintenance.
-   Run script to sync prod db with dev
-   Make changes in dev, verify, sync to prod.

Alternatively, build content migrations when possible.

https://craftcms.stackexchange.com/questions/10/whats-the-best-practice-for-handling-data-migration-and-organization-across-dev/15#15

We need to write some simple scripts to be used in each project.

-   pull db from prod
-   push db to prod
-   pull assets from prod, skip duplicates
-   push assets to prod, skip duplicates
