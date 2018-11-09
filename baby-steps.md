# Baby Steps

Clearly, every language requires a 'Hello, World!' program.

There are mainly three ways of executing citron code:

* with the main executable `ctr`
* with the scratchpad \(neat thing, tbh\) \(see [Scratchpad]()\)
* with the \(JIT\) interpreter
* compiling it with `ctrc` and executing that \[this only generates a simple program that links into the Citron runtime, it is not static\]

### Using the Interpreter Prompt

Presumably, you have a terminal window open from back when you compiled citron from source, so switch to it,

and start the interpreter by executing `citron` and pressing `<return>`

Once you have started the interpreter, it will greet you with a nice-looking ascii art,

and the main prompt \(default `⠕` \)

Type `Pen writeln: 'Hello, World!'` followed by the return key.

You shall see the magical words `Hello, World!` printed to the screen. \(and a `[_:Object]` which signifies the object `Pen`; in general, Objects without the method toString are shown in this format: `[<name in current context>:Type]`\)

Here's an example of what you might expect to see:

```
$ citron
Terminal: 24x83 - 0x0
  _____ _ _
 / ____(_) |
| |     _| |_ _ __ ___  _ __
| |    | | __| '__/ _ \| '_ \  Project Citron
| |____| | |_| | | (_) | | | |
 \_____|_|\__|_|  \___/|_| |_|

0.0.8.8-boehm-gc [GCC/G++ 8.2.0]
⠕ Pen writeln: 'Hello, World!'
Hello, World!
[_:Object]
```

#### How do I quit this interpreter?

Type `:q` and press return.

Or just press Ctrl + D.

or if you really like punching in expressions, evaluate `Eval end`

### Choosing an editor

Currently, Atom, TextMate and Sublime 3 syntax files are generated and maintained.  
However, minimal Smalltalk syntax highlighting will do in a pinch

### Using a source file

Back to coding.

Open a new file \[I have used `main.ctr` for most of the files\] \(generic extension is `.ctr`\) and type this in:

```ruby
Pen writeln: 'Hello, World!'.
```

Then simply run `ctr` with the sole argument being the path to the file.

```
$ ctr main.ctr
Hello, World!
```



