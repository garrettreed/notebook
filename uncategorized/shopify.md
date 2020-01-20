# Shopify Theme Development

## Slate vs Theme Kit

Slate wins for live reloading, and modern starter themes.

> Slate is a bunch of tooling built on top of Themekit. Themekit is more just a client with the themes API, letting you use whichever tools you need on top. Slate has an opinionated set of tools that Shopify uses to develop its own themes.

Theme Kit wins overall because:

1. Can’t convert an existing theme into a slate project without translating it to match the structure
2. Can’t easily reconcile changes from remote
3. ~~Unpredictable behavior when multiple people are working on theme (theme kit just stops you until changes are reconciled)~~ Theme Kit removed their asset manifest so it also overwrites things.
4. Slate is not actively developed/supported (edited)

## Starter theme

-   How are JS files loaded per-page?
-   What are the default sections? Can you remove them?
-   Pagination?
-   Can you restrict sections to a page
-   How does starter-theme template files and structure compare to timber?
-   SCSS bindings and sass compliation?
    -   https://www.shopify.com/partners/blog/a-beginners-guide-to-sass-with-shopify-part-3
    -   Will need to compile to a scss.liquid file using escaping for any liquid syntax

## Resources

-   Theme kit commands https://shopify.github.io/themekit/commands/
-   Theme scripts repo https://github.com/Shopify/theme-scripts
-   Theme sections, building themes docs: https://help.shopify.com/en/themes/development/sections
-   Customizing themes and sections https://help.shopify.com/en/manual/using-themes/change-the-layout/theme-settings/sections-and-settings
-   Theme kit walkthrough: https://www.shopify.com/partners/blog/95401862-3-simple-steps-for-setting-up-a-local-shopify-theme-development-environment
-   Code shopify articles: http://www.codeshopify.com/blog_posts
-   Developer tools app: https://help.shopify.com/en/api/tools/developer-tools#usage
-   Pagination in liquid: https://www.shopify.com/partners/blog/shopify-pagination
-   Lazy loading: https://www.shopify.com/partners/blog/lazy-loading
-   Theme store checklist: https://help.shopify.com/en/themes/development/theme-store-requirements
