# `fetch`

-   HTTP errors do not throw errors. Need to check the status code (or `ok`) and then throw.
-   [Fetch definition](https://developer.mozilla.org/en-US/docs/Web/API/WindowOrWorkerGlobalScope/fetch)
-   [Response](https://developer.mozilla.org/en-US/docs/Web/API/Response)

```js
async function getIt() {
    var response = await fetch("https://some-domain.com/api/things", {
        method: "POST",
        headers: {
            Authorization: "Bearer blah",
        },
        body: {
            thing: "hello",
        },
    });

    var data = await response.json(); // will fail unless response is json.
    if (response.ok) {
        return data;
    } else {
        throw Error(data.message); // however error is returned
    }
}

(async function () {
    try {
        var res = await getIt();
        console.log("response", res);
    } catch (err) {
        console.log("error", err);
    }
    console.log("done");
})();
```
