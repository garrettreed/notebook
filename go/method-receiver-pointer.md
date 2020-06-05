# Should methods be declared on T or \*T?

Pointer, unless you need a copy of the receiver's value. It's too easy to be unaware that you are embedding a type that has methods that mutate its values. By using a value receiver, you are going to copy the value, breaking its original intent.
