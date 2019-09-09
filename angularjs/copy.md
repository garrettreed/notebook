# `angular.copy()`

-   How to sync objects and arrays between services and controllers
-   Before, I would do something like this:

    ```js
    app.controller("Ctrl1", function(dataService) {
        var vm = this;
        vm.items = dataService.items;

        dataService.updateItems().then(function() {
            vm.items = dataService.items;
        });
    });
    ```

-   A better solution is to utilize `angular.copy` with a destination in the service to update the service variable rather than reinitializing it:

    ```js
    app.controller("Ctrl", function(dataService) {
        var vm = this;
        vm.items = dataFactory.items;
        dataFactory.getItems();
    });

    app.factory("dataService", function() {
        var service = {
            items: [],
            updateItems: updateItems
        };
        return service;
        function updateItems() {
            // ... //
            angular.copy(newItems, service.items);
            // ... //
        }
    });
    ```
