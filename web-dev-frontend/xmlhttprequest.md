# AJAX

[Really good docs and examples at MDN](https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest/Using_XMLHttpRequest)

## GET

```js
function transferComplete() {
    console.log(this.responseText);
}

var oReq = new XMLHttpRequest();
oReq.addEventListener("load", transferComplete);
oReq.open("GET", "http://www.example.org/example.txt");
oReq.send();
```

## POST

```js
var params = {
    foo: "foo",
    bar: "bar"
};

function transferComplete() {
    console.log(this.responseText);
}

var oReq = new XMLHttpRequest();
oReq.addEventListener("load", transferComplete);
oReq.open("POST", "http://validate.jsontest.com/", true);
oReq.setRequestHeader("Content-type", "application/x-www-form-urlencoded"); // must come after open
oReq.send("json=" + encodeURIComponent(JSON.stringify(params)));
```
