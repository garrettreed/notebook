# Idempotent actions in REST

Mostly taken from this article: https://stormpath.com/blog/put-or-post

-   `POST` is not idempotent. `PUT` is.
-   Idempotent HTTP Requests: will result in the same state on the server no matter how many times the request is executed.
-   `PUT` requests are only idempotent if all of the resource's properties are passed.
    -   Example, changing the name of a resource in a `PUT` request, but not passing `status` could result in different server states if the `status` was changed in another request.
-   Server state != Client state. A client can send two identical requests and receive an error for only one. That is still idempotent if the server state has not changed.
-   Use `POST` to create resources when you do not know the resource ID
-   Idempotency has a strong correlation to being cacheable by HTTP caching servers
-   `PATCH` is an action for partial updates, but that is covered by `POST`, so there is little need for this.
-   What about an `updated_at` timestamp field, or any other auto-generated logging field?
    -   If the client can repeatedly and safely call a service, with no effective side-effects as far as their interface to the resource is concerned then it can be considered idempotent
    -   https://stackoverflow.com/questions/5686671/should-i-use-put-method-for-update-if-i-also-update-a-timestamp-attribute
