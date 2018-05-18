## The standard library

The library is still a work in progress, but it should have the basic needs, and facilities to interface C APIs for less common needs.

The layout of the library closely resembles Haskell's, with the library being split into several categories.

The current categories \(as of Citron 0.0.8\) are:

* AST : contains simple interfaces to change or view the AST of a program
* Control : contains various modules to handle or change the program control flow
* Data : contains modules for data structures
* Executable : executable modules, which can be run with `citron -m <name>`
* Extensions : loads the old extensions \(deprecated\)
* Foreign : contains modules that handle the foreign functions interfacing
* Functional : contains modules that allow for a more functional style of coding
* Graphics : graphical things
* GUI : modules for creation and handling of user interfaces
* Net : modules that handle sockets and networks
* Utils : various utilities

### The Control category

* Applicative : Adds several method to CodeBlock for convenience, for instance `apply:` and `compose:`
* Arrow : Adds an arrow method to Object to resolve methods and properties
* Class : WIP module that adds classification \(To be replaced by Categorization\)
* Error : Several Basic error types, implemented for your convenience
* Method : An object that generates generic message sender methods
* MethodResolve : A way to extract methods \(raw, or with refs\) from objects, and use them as code blocks

### The Data category

* Array : mostly deprecated stuff. subject to removal
* IO : /StringIO -&gt; Fake strings as files.
* Iterator : Deprecated. Use `Generator` instead
* List : Implementation of LinkedLists \(for whatever reason\)
* Map : simplify your use of Maps
* Range : Non-lazy list generators
* Ratio : Fractions as ratios
* Set
* * /HashSet : Implementation of HashSets
  * /BloomFilter : Implementation of BloomFilters 
* String : Nothing.
* SwitchCase : Generate a map of alternatives and execute one of them.

### The Executable category

* cpm : A package manager. read its help with `citron -m cpm`

### The Foreign/C category

This category is dedicated to interfacing foreign functions, and has a complementary plugin \(libctrctypes.so\)

* Alloc : Allocate raw memory with specific sizes
* C\_Types : common import with names for common C types
* errno : module to handle C errno
* NamedStruct : Structs with named members
* PackedArray : Contiguous Array with uniform native types
* Signal : Handle or trade signals with other programs



TODO: Finish this page



