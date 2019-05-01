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
    #`self' here is a direct reference to this block
    ^{
        ^self. #and it still references that block
    }.
}. #self is implicitly filled, acts as if it never existed
fn applyTo: 1024. #par gets assigned 1024
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
[_:Block]
⠕ fn applyTo: 1.
I got some 1 and a bunch of Array new
[_:Block]
⠕ fn applyTo: 1 and: 2.
I got some 1 and a bunch of Array ← 2
[_:Block]
⠕ fn applyAll: [1,2,3].
I got some 1 and a bunch of Array ← 2 ; 3
[_:Block]
⠕ fn applyAll: [1].
I got some 1 and a bunch of Array new
[_:Block]
```

### Calling by Reference vs Calling by Value

Normally, "simple" objects are passed by value, and the rest are passed by reference;

However, by prepending an ampersand \(`&`\) to an argument, it will _always_ be passed as a reference.

##### Note

Lambdas and Lexical Blocks will _not_ accept reference arguments

Here's a handy table:

| Type\Behaviour | Behaviour under `:arg` | Behaviour under `:&arg` | Behaviour under `:*arg` |
| :--- | :--- | :--- | :--- |
| Nil | Reference | Reference | Reference |
| String | Copy | Reference | Reference |
| Boolean | Copy | Reference | Reference |
| Number | Copy | Reference | Reference |
| Array | Reference | Reference | Reference |
| Any other type | Reference | Reference | Reference |

### Calling functions

There are several ways to interact with functions, each can be used for some very specific purpose:

1. Simply using the different messages that `CodeBlock` provides: `applyTo:[and:]*` and `applyAll:`

   * `func applyTo: 1 and: 2`
   * `func applyAll: [1, 2]`

2. Using the call shorthand \(`expr [...]` by default\)

   * `func [1, 2]`

3. using the infix function call \(for binary functions\)

   * ``1 `func` 2``
   * This mode can be configured \(with a pragma\) to lazily pass the arguments

4. using the lazy call shorthand \(not configurable\) \(`expr {...}`\)

   * `func {1, 2}`

### Example outlining all the above methods

```ruby
⠕ var fun0 is \:x:y x + y
[_:Block]
⠕ fun0 applyTo: 1 and: 2
3
⠕ fun0 applyAll: [1, 2]
3
⠕ fun0 [1, 2]
3
⠕ 1 `fun0` 2
3
# lazy evaluation style => explicit evaluation
⠕ var fun0 is \:x:y x evaluate + y evaluate
[_:Block]
# a pragma in eval
⠕ :!pragmaOnce::declare lazyev fun0
⠕ 1 `fun0` 2
3
⠕ fun0 {1, 2}
3
⠕ var fun_ref is {:&x:y ^(x +=: 1) + y.}
[_:Block]
⠕ var x is 1
1
⠕ var y is 2
2
⠕ fun_ref[x, y]
4
⠕ x
2
⠕ y
2
```


[<- Prev](control-flow.md) [Next ->](intermission-interpreter-commands.md)
