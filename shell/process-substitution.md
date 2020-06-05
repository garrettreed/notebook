# Process Substitution

-   Syntax: `< <()`
-   `command1 < <( command2 )` is like `command2 | command1`, but the pipe creates a subshell. Process substitution does not.

## Use case

```sh
count=0
while read line; do
   echo $line
   count=$((count+1))
done< <(ls)
echo "done: ${count}"
```

`$count` works here because the `while` loop is in the same process. It will return `0` in the pipe example below:

```sh
count=0
ls | while read line; do
   echo $line
   count=$((count+1))
done
echo "done: ${count}"
```
