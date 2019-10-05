# Static asset versioning/revisioning with a manifest

-   https://github.com/clubstudioltd/craft-asset-rev
-   https://github.com/sindresorhus/gulp-rev
-   https://nystudio107.com/blog/simple-static-asset-versioning
-   https://www.alainschlesser.com/bust-cache-content-hash/
-   http://www.stevesouders.com/blog/2008/08/23/revving-filenames-dont-use-querystring/

## Query Strings

Depending on the servers that the visitors connection is passing through, it's possible urls with a query string will never be cached.
I would typically use this approach with a file modification time. Probably going to be busted on every deploy. Great for hands-off, but not the best approach.

## Hash

Using the tools above, you can generate string from the hashed content of the files. That can be appended to the filename. A manifest file contains a list of all static filenames. Use a function on the backend to look up the url for each asset.
