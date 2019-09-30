# Update a forked repo with latest upstream

1. `git remote add upstream https://github.com/original-repo/goes-here.git`
2. `git fetch upstream`
3. `git rebase upstream/master`
4. `git push origin master --force`
