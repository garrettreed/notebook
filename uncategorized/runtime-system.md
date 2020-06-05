# Runtime System

-   Could be categorized under programming languages or compilers.
-   Implements portions of an execution model.
    -   Programming languages consist of a grammar/syntax and an execution model.
    -   Order of precedence of operations is an example of a piece of an execution model.
-   Provides an environment in which the programs run.
-   May address management of application memory, how the program accesses variables, mechanisms for passing params between procedures, interfacing with the operating system, etc.
-   The compiler makes assumptions depending on the specific runtime system to generate correct code.
-   Takes responsibility for managing the stack, heap, garbage collection, threads, and other dynamic features of the language
-   The Java runtime consists of the virtual machine and the standard library
-   A common C runtime consists of the loader and the runtime library, which implements the parts of the C language which are not built into the executable by the compiler.
