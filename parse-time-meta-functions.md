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

\(First, see [Parser Pragmas](/parser-pragmas.mdci "read this first, pleeeeeeeeeease")\)

Through the use of the `declare` pragma, it is possible to create a function that does not evaluate its arguments before being invoked, but rather explicitly after.

### Example:

```ruby
#:declare lazyev then

# These sorts of functions are always binary
var letIn is {\:_x:_y
    $!(_x). # Evaluate the first argument, and discard its value
    $!(_y). # Evaluate the second argument, and return its value
}.

(var a is 123) `letIn` (a + 64). # => 187
# which is equivalent to the following expression
letIn applyAll: [$(var a is 123), $(a + 64)]. # => 187

#:declare lazyev if-then

# let's write if-then in a more elegant format
var if-then is {\:if:then
    $!(if) ifTrue: {
        ^$!(then).
    }.
}.

var x is 123.

(x = 123) `if-then` (Pen writeln: 'x really is $$x'). # be careful not to shadow `x' in the if-then definition
# -> x really is 123
```

Let's take a look at how PatternMatch's `match` function works

```ruby
{:self:ast

var done is True.
var ret is Nil.
var cblk is thisBlock.
ast each_v: {:__PMATCH_V0 # For each sub-tuple in the main tuple
  __PMATCH_V0 is $!(__PMATCH_V0). #Parse the tuple
  done is True.
  ret is {
    self unpack: $!(__PMATCH_V0 head). # Try to unpack the object
    $!(__PMATCH_V0 tail init) all: {\:__PMATCH_V1 # Then assuming the unpacking worked, check all the guards (if any)
      Reflect runHere: {^$!(__PMATCH_V1).} forObject: self arguments: [].
    }, ifFalse: {
      cblk error: 'guard fail'. # If the guard returned false, let this pmatch fail
    }.
    ^Reflect runHere: {^$!(__PMATCH_V0 last).} forObject: self arguments: []. # Assuming everything went well, run the last expression
  } catch: {:e done is False. }, run. # if anything failed, move on through the tuple
  done break. # otherwise, stop
}.
done ifFalse: { cblk error: 'non-exhaustive pattern match'. }. # if after going through the whole list, we didn't find a suitable match, raise an exception
^ret. # return the value

}.
```


[<- Prev](standard-library.md) [Next ->](parser-pragmas.md)
