# `useCallback`

-   `useCallback(fn, deps)` is equivalent to `useMemo(() => fn, deps)`.
-   `useMemo` can be used as a performance optimization, but not a guarantee that the value will be unchanged. Code should be written to work without `useMemo`. React docs: React may choose to “forget” some previously memoized values and recalculate them on next render, e.g. to free memory for offscreen components
-   Generally, avoid trying to optimize for unnecessary re-renders. Only do so in the case of expensive functions.
