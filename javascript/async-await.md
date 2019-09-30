# Async/await

-   `await` can't be used top-level. Must be within an async function.
-   Can `await` any object with a `then` method.
-   Just use promises though.
-   Error handling with `catch`. Use `finally` too.

## Converting promises practice

```js
function getJson(url) {
    return fetch(url).then(function(response) {
        if (response.status === 200) {
            return response.json();
        } else {
            throw new Error(response.status);
        }
    });
}

getJson("https://jsonplaceholder.typicode.com/todos/1")
    .then(function(response) {
        console.log("success", response);
    })
    .catch(function(err) {
        console.log("error", err);
    });

//////////

async function getJson(url) {
    let response = await fetch(url);
    if (response.status === 200) {
        return response.json();
    }

    throw new Error(response.status);
}

async function go() {
    try {
        const response = await getJson("https://jsonplaceholder.typicode.com/todos/1");
        console.log("success:", response);
    } catch (e) {
        console.log("error:", e);
    }
}
go();
```

## Make things synchronous

```js
async function wait() {
    await new Promise(function(resolve, reject) {
        setTimeout(resolve, 1000);
    });
    return 10;
}

async function go() {
    console.log("hi");
    const result = await wait();
    console.log(result);
    console.log("hello");
}
go();
```
