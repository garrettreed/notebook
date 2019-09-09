# Redirect in UI Router Resolve block

```js
resolve: {
    welcomeRedirect: function(
        $timeout,
        $q,
        $state,
        WelcomeService,
        UserService,
        loadUser
    ) {
        var deferred = $q.defer();

        $timeout(function() {
            console.log(
                UserService.hasCoupon("GRIZAPPWELCOME"),
                WelcomeService.userReacted
            );
            if (
                UserService.hasCoupon("GRIZAPPWELCOME") &&
                !WelcomeService.userReacted
            ) {
                $state.go("root.welcome");
                deferred.reject();
            } else {
                deferred.resolve();
            }
        });

        return deferred.promise;
    }
}
```
