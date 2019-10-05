# npm publish

-   `npm publish [<tarball>|<folder>][--tag <tag>] [--access <public|restricted>][--otp otpcode] [--dry-run]`
-   Will publish to the public registry by default (if logged in)
-   If `.npmignore` and `.gitignore` files exist and a file is in `.gitignore` but not `.npmignore`, it will be included.
-   Sets tag to latest if none specified.
-   Fails if version has already been published.
