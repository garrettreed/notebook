# `require`, `require_once`, `include`

When to use `require` vs `include`:

The `require()` function is identical to `include()`, except that it handles errors differently. If an error occurs, the `include()` function generates a warning, but the script will continue execution. The `require()` generates a fatal error, and the script will stop.

When to use `require_once` vs `require`:

The `require_once()` statement is identical to `require()` except PHP will check if the file has already been included, and if so, not include (require) it again.
