# `noopener` and `noreferrer` link `rel` values

-   When a page is opened using `target="_blank"`, the pages may run on the same process and can affect each others' performance.
-   The linked-to page can access the `window` object of the original page via `window.opener`
-   `rel="noopener"` prevents the new page from being able ot access the `window.opener` property and ensures it runs in a separate process.
-   `rel="noreferrer"` has the same effect, but also prevents the `Referrer` header from being sent.
-   Prefer using `noopener` for tracking purposes.
