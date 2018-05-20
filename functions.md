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

Functions will behave just like code blocks in every aspect.

### The \`self' parameter

In order to mitigate the problem with `me` always referencing the current block, you may simply add `self` as the first parameter to the block, like so:

```ruby
fn is {:self:par
    Pen writeln: par.
}. #self is implicitly filled, acts as if it never existed
```

### Varargs

To collect all extra arguments in an array, you may provide a vararg `*argument_name` in the formal parameters

```ruby
fn is {:x:*ys
    Pen writeln: 'I got some $$x and a bunch of $$ys'.
}.
```

Evaluation of different callings:

```ctr
⠒⠂fn is {:x:*ys Pen writeln: 'I got some $$x and a bunch of $$ys'.}.
_
⠭⠕ fn applyTo: 1.
I got some 1 and a bunch of Array new
_
⠭⠕ fn applyTo: 1 and: 2.
I got some 1 and a bunch of Array ← 2
_
⠭⠕ fn applyAll: [1,2,3].
I got some 1 and a bunch of Array ← 2 ; 3
_
⠭⠕ fn applyAll: [1].
I got some 1 and a bunch of Array new
_
```



