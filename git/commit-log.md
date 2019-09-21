# Git global commit log

A very dumb script to use as a global `post-commit`. Should probably use `-C` flag instead of `cd`, but I ran into some issues with it messing with the worktree, and this works fine for now.

```sh
#!/bin/sh

function append {
    DOSSIER_COMMIT=$(git log --format="$(basename "$PWD"), %H, %ai, %s" -1)
    cd ~/Code/dossier

    git pull --rebase && \
    cd - && \
    echo $DOSSIER_COMMIT >> ~/Code/dossier/commits && \
    cd ~/Code/dossier && \
    git add -A && \
    git commit -m "$DOSSIER_COMMIT" && \
    git push

    cd -
}

append > /dev/null 2>&1
```
