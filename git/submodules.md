# Git Submodules

# Git Submodules

## Cloning a repo with submodules

When a repo with submodules is cloned, the directory for the submodule(s) will be created, but not populated. To fix this, run two commands:

1. `git submodule init`: initialize your local configuration file in `.git/config`

2. `git submodule update`: fetch all the data from the submodule(s) project and check out the appropriate commit listed when the submodule was added..

Cloning with the `--recurse-submodules` option is an alias for this.

## Pulling upstream changes

You can manually go into each submodule and `git pull`.

To avoid doing it manually, run `git submodule update --remote`.

Git will assume you want the latest `master` branch of each submodule. You can override this globally in `.gitmodules` or locally in `.git/config`:

-   `git config submodule.SubmoduleName.branch stable`: adds to `.git/config`

-   `git config -f .gitmodules submodule.SubmoduleName.branch stable`: adds to `.gitmodules`

At this point, `git status` show that there are new commits in the submodules. If you `cd` to the submodule and run `git status`, it will show that the submodule is detached at the latest commit.

`git submodule update --remote --rebase`: Fetches the changes and rebases them onto the default branch, so that the head is not detached. More akin to going into each submodule and pulling. You can also avoid typing the flag by setting it in the submodule config:`git config -f .gitmodules submodule.SubmoduleName.update rebase`. Another option is `--merge`, but it might create a commit.
