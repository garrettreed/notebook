# State Machines

```js
const machine = {
    state: "idle",
    transitions: {
        idle: {
            click: function () {
                this.changeStateTo("fetching");
                service.getData.then(
                    (data) => {
                        try {
                            this.dispatch("success", JSON.parse(data));
                        } catch (error) {
                            this.dispatch("failure", error);
                        }
                    },
                    (error) => this.dispatch("failure", error)
                );
            },
        },
        fetching: {
            success: function () {
                // render ...
                this.changeStateTo("idle");
            },
            failure: function () {
                this.changeStateTo("error");
            },
        },
        error: {
            retry: function () {
                this.changeStateTo("idle");
                this.dispatch("click");
            },
        },
    },
    dispatch(actionName, ...payload) {
        const actions = this.transitions[this.state];
        const action = this.transitions[this.state][actionName];

        if (action) {
            action.apply(machine, ...payload);
        }
    },
    changeStateTo(newState) {
        this.state = newState;
    },
};

machine.dispatch("click");
```
