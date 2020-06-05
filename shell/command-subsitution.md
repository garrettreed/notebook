# Command Substitution

The backticks/gravemarks have been deprecated in favor of `$()` for command substitution because `$()` can easily nest within itself as in `$(echo foo$(echo bar))`. There are other differences such as how backslashes are parsed in the backtick/gravemark version, etc.

See [BashFAQ/082](http://mywiki.wooledge.org/BashFAQ/082) for several reasons to always prefer the `$(...)` syntax.

Also see the [POSIX spec](http://pubs.opengroup.org/onlinepubs/9699919799/xrat/V4_xcu_chap02.html#tag_23_02_06_03) for detailed information on the various differences.
