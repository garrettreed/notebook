# Cloudflare

## Prevent cloudflare from overriding origin cache policies

-   In the Caching panel, under Browser Cache Expiration, choose "Respect Existing Headers".
-   Create a global page rule `domain.tld/*` with "Origin Cache Control: On"

## `strict-transport-security` HTTP Header

-   This will cause your site to start failing if you have to turn off https and it can be a real pain to clear your hsts cache.
-   In the SSL/TLS panel, under the Edge Certificates tab, turn "Always Use HTTPS" on.
-   Enable HSTS and configure it accoringly. I usually enable all except preoload if possible.

## `email-decode.min.js`

Injected when ScrapeShield is enabled (default).
