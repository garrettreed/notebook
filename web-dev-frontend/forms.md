# Forms

Easy to submit a `<form>` element:

```js
const jsFormSubmit = event => {
    event.preventDefault();

    fetch(targetUrl, {
        method: "POST",
        body: new FormData(event.target)
    });
};
form.addEventListener("submit", jsFormSubmit);
```

Any time you have multiple inputs that are related, they should be wrapped with a `<fieldset>` tag. One example could be two fields asking for a first name and last name. The most relevant use case for the `<fieldset>` is for radio or checkbox inputs. Almost always they are grouped together. The inputs themselves each have a label, and the group itself also needs a “label”, but when working with a `<fieldset>`, we use the `<legend>` tag.

The `name` attribute is required for any form input to send identifiable data to a server. By default, it’s what is used as the key in the query stirng for a `GET` request, or in the body of a POST request. So you would think that it’s obvious we need it.

Labels (3 options):

-   Label wrapping the input: `<label>Name: <input name="name"></label>`
-   Label with for attribute: `<label for="name">Name:</label><input name="name">`
-   aria-label: Name: `<input name="name" aria-label="Name">`

Submit (2 options):

-   `<input type="submit" value="Submit this form">`
-   `<button type="submit">Submit this form</button>`
