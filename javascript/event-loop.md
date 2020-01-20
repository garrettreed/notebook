# JS Event Loop

Awesome talk here: https://www.youtube.com/watch?v=8aGhZQkoFbQ
Visualization tool shown in talk: http://latentflip.com/loupe

Main concepts:

-   Stack - the regular execution stack
-   webapis - in node this would be c++ apis. The stuff that can actually handle threading. `setTimeout`, `XMLHttpRequest`, etc
-   Event Loop
-   Task Queue

Things in the stack can call webapis. webapis can push their callbacks to the task queue. The event loop continually checks to see if the stack is empty. If it is, the first item in the event queue is moved onto the stack.

Illustrates that setTimeout isn't a guaranteed time to execution, but a minimum.
