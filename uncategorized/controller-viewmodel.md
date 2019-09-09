# Controller vs ViewModel

## Controller in MVC

-   Controller automatically bound to view.
-   Controller gets data from the view or whatever the framework uses to store view data (context, bag, etc).
-   Controller manipulates the data on events.

## ViewModel in MVVM

-   ViewModel has methods called (& properties set) by the View, which is the actual component receiving control upon user interaction. (Developer has to write some (declarative) code in the View in order to call the ViewModel.)
-   ViewModel has not an explicitly chatty communication with View compared to PresentationModel (i.e. it does not call View a lot, the framework does it). But it has a lot of properties that map 1 to 1 with View settings. It still contains the same logic to figure out the value of all those settings.
-   ViewModel does not explicitly show a notion of application workflow. It is usually thought of as returning control to the calling View.

## My Understanding

In traditional MVC, the controller is a direct representation of the model. A viewmodel is more heavily tied to the view, or frontend. It acts as a binder to the backend or model, translating as necessary. Allows the view to directly communicate with the backend via data binding.
