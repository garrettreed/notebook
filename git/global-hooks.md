# Git global hooks

https://coderwall.com/p/jp7d5q/create-a-global-git-commit-hook

1. Enable git templates:

`git config --global init.templatedir '~/.git-templates'`

This tells git to copy everything in `~/.git-templates` to your per-project `.git/` directory when you run git init

2. Create a directory to hold the global hooks:

`mkdir -p ~/.git-templates/hooks`

3. Write your hooks in `~/.git-templates/hooks/`.

For example, here's a post-commit hook (located in `~/.git-templates/hooks/post-commit`):

```sh
#!/bin/sh

# Copy last commit hash to clipboard on commit
git log -1 --format=format:%h | pbcopy
```

4. Make sure the hook is executable.
   `chmod a+x ~/.git-templates/hooks/post-commit`

5. Re-initialize git in each existing repo you'd like to use this in:
   `git init`

NOTE if you already have a hook defined in your local git repo, this will not overwrite it.
