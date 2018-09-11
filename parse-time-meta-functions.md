## Meta Functions

If you've survived this far, congrats; the ride is going to get even crazier from here.

Meta functions, Basically, allow a function to modify the internal representation of an expression, and optionally return a replacement for it.

They are in a way modeled and built to remedy the need for macros, but ended up quite a bit more powerful \(as they are somewhat context aware\)

Their definition is absolutely the same as every other function, except they do...meta things.

The basic building blocks are the several compiler intrinsics listed below:

1. `$(expr)`
2. `$!(expr)`
3. `$[expr, expr, ...]`
4. `$'(expr)` or `$'expr`
5. ``$`(expr)`` or ``$`expr``

A brief explanation of their behaviour is as follows:

1. is replaced by the internal \(AST\) representation of the expression
2. splices the meta-expression back into the code; it is the reverse action of 1 
3. is replaced by a tuple containing the AST representation of the contained expressions
4. quotes an expression \(bare references are converted to symbols\)
5. escapes a quoted expression and embeds a value into it

#### A simple example

```ruby
var if-then-else is {:ast 
    ^$!(ast head) either: { #if the first expression evaluates to a truthy value
        ^$!(ast at: 1). #evaluate the second expression
    } or: {
        ^$!(ast at: 2). #otherwise, evaluate the third expression
    }.
}.
var a is Nil.

if-then-else applyTo: 
    $[ # To get a tuple of expressions
        1 = 2, # the condition
        a is 'No Way!', # the if-true branch
        a is 'That\'s right'. # the if-false branch
    ].
# This whole expression will evaluate to the result of "a is 'That\'s right'", which is the string
```

Of course, this feels clunky, and looks weird, but there are more ways to deal with metafunctions, in a more elegant way.

\(First, see [Parser Pragmas](#parser-pragmas)\)

Through the use of the `declare` pragma, it is possible to create a function that does not evaluate its arguments before being invoked, but rather explicitly after.

### Example: