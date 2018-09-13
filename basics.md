## Basics

Printing `Hello, World!` is always exciting and all, but it's never enough...maybe some inputs, processing, and some actually useful output is always preferred!

### Comments

_Comments_ always span a signle line, beginning with the character `#`

\(Do note that the interactive interpreter will not allow comments\)  
For example:

```ruby
Pen writeln: 'Hello, World'. #Totally ignore me, okay?
```

or:

```ruby
#Pen is an Object, and 'writeln:' is a message
Pen writeln: 'HELLO!'.
```

Some people like comments, so make sure to use them lots, okay?

### Literals

An example of a literal is a number, like `5`, `3.14`, `0xAF` or a string `'Hello'`.

#### Numbers

The only numeric type available to the programmer is `Number`, which can store up to a 64-bit double's worth.

\(`BigInteger` is available for arbitrary precision Integer numeric values as well\)

### Strings

String literals are created in two ways:

* Strings with processed escape codes -- which are enclosed in single quotes: `'Hello, world!\n`'
* 'Raw' Strings, which are quoted literally \(mainly used for regular expressions, or embedding other languages\), enclosed in `?>` and `<?` : `?>\s\t\w<?`

Both of these can span multiple lines.

#### String formatting

clearly everyone needs string formatting

Two solutions are provided:

* Embedding a variable inside the string: `Hello, $$name !'`

* Using the format methods: `'Hello, %s!' % [name]`

* or the other format method: `'Hello, %{name}' %~: (Map fromArray: [['name', 'What']]`

The first solution is used as a quick-and-dirty way to embed single variables inside a string, and are processed by the lexer to a string addition expression: `'Hello, ' + name + ' !'`

The second one uses a method of the String object, `%` which provides printf-like string formatting

```ruby
var age is 21.
var name is 'Semicolon'.

# Note that this $$var is not very versatile, it will only break on whitespace and such
Pen writeln: 'Hello, $$name you seem to have an age of $$age'.
Pen writeln: 'Hello, %s you seem to have an age of %d' % [name, age].
```

#### Escape sequences

The normal, basic sequences are supported.

Also a way of embedding characters as hexadecimal is provided: `\x12`

which will consume all the hexadecimal digits it can.

### Tuples

Contrary to what you might be used to, Citron's tuples are generated at _parse time_ and have a \(pretty much\) immutable structure

They are created like so:

```ruby
[element0, element1] # A tuple with two elements. you can treat this like an Array object
[] # An empty tuple
```

#### Code Blocks

A code block is just like a normal function, except the fact that it is _anonymous_.

It may or may not be a closure.

There are two main code block types:

* Basic code block -- which is always executed whenever it is required to. `{ (:param)* (expression.)* }`
* Lexically scoped code block -- which always captures every value that is not in its formal parameters. `{\ (:param)* (expression.)* }`

To return from a block, the return token `^` is used.

A shorthand for a lexical code block with a single expression and at least one parameter \(quite like a lambda\) exists: `\(:param)+ expression`

which is translated to `{\(:param)+ ^expression.}` by the parser.

#### Object

Anything and everything is an Object in Citron. _No Exceptions_

\(This does not mean that Citron _enforces_ the idea of Object-Oriented Programming, but that is the most simple way of using the language\)

### Code Lines & Semantics

All the statements _must_ end in a dot \(`.`\)

You may put all the statements in a single line \(why would you want to?\)

Whitespace is ignored, and has virtually no meaning.

### Assignment

There are three main forms of assignment in Citron, all of which have the general from `expr (:= | is) expr`

1. assignment to an existing reference: `name is value`
2. creation and assignment to a new reference: `(var | my) name is value`
3. assignment by deconstruction: `type_var is value`, which we will get back to in another chapter.

Every reference can optionally have three different modifiers \(Only one can be active at any given time\):

1. `var` : simply creates a new reference if no old ones exist, otherwise binds to them
2. `my`   : creates or binds to a property of the current object.
3. `const` : tries to capture a variable from the environment around the currrent object

There is a shorthand for assignment to an object property \(`my property is value`\): `property => value`

which will prove useful in certain points \(which we will explore in later chapters\).

