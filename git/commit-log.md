# Git global commit log

A very dumb script to use as a global `post-commit`. Should probably use `-C` flag instead of `cd`, but I ran into some issues with it messing with the worktree, and this works fine for now.

```sh
#!/bin/sh

function append {
    cd ~/.git-commit-log

    git pull --rebase && \
    cd - && \
    echo $(basename "$PWD") $(git log -1) >> ~/.git-commit-log/commits && \
    cd ~/.git-commit-log && \
    git add -A && \
    git commit -m 'Commit' && \
    git push

    cd -
}

append > /dev/null 2>&1
```
