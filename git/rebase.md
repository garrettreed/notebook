# Git Rebasing

## Rebase vs Merge

-   `merge` should only be used for incorporating the entire feature set of one branch into another one
-   All other cases should use a form of `rebase`

## Four main tools

1. `git commit --amend`
2. `git merge` with or without `--no-ff`
3. `git rebase`, with `-i` and `-p`
4. `git cherry-pick`

## Core Principles

-   When merging a temporary local branch, fast-forward merge
-   When merging a well-known branch, true merge
-   Before pushing local work, Clean up history
-   When push is denied because remote was updated, rebase the remote to local
