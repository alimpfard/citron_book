## Functions

functions in citron are simply code blocks given name.

to make a function, you may simply assign a code block to a variable:

```ruby
var fn is {:x:y
    Pen writeln: (x abs - y).
    ^x pow: y.
}.
```

and to call a function, simply send a message to it:

```ruby
fn applyTo: 1 and: 2. #apply arguments over several keyword args
fn applyAll: [1, 2]. #apply all arguments at once with a tuple
```

If not enough arguments are passed, depending on the message, you might get either an exception, or have the parameter simply evaluate to `Nil`

\(`CodeBlock::'applyAll:'` will throw an exception if more or less arguments are provided\)



