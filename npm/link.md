# npm link

-   Used to use packages locally so you can test integration without publishing every change. Two step process:
    1. `npm link` in a package directory will symlink it as a global npm module (in my case that's `/usr/local/lib/node_modules/`)
    2. `npm link package-name` in the project that you want to use the package. The package will be symlinked into node modules.
-   `package-name` is the one in `package.json`, not the dir name.
-   Shortcut possible by changing `package-name` to the relative directory. `npm link ../dir-name` would execute the previous two steps.
-   Scoped packages must include the scope: `npm link @org/package-name`
-   Versions are also possible: `npm link @org/package-name@1.0.0
