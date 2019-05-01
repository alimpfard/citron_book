## Parser Pragmas

The parser supports pragmas in the form of `#:pragma_name arguments` that modify its behaviour, and these are completely irrelevant to the actual control flow of the program.

### Basic Pragmas

* `#:oneLineExpressions`
  * Promise to be a good child, and end your expressions in one line, and the parser will place the ending dots for you
* `#:regexLineCheck`
  * will force the use of regular expressions for newline detection \(deprecated, really\)

### Not-so-basic Pragmas

* `#:callShorthand LEFT RIGHT`

  * Will replace the call shorthand `expr[]` with `expr LEFT RIGHT`
  * the only accepted tokens are any mix of `{` `[` `(` `)` `]` `}`

* `#:declare <infixl|infixr|lazyev> [prec] <reference>`

  * Declares the fixity or laziness of a reference \(only used when it is invoked through ``A `ref` B``

* `#:language <comma-separated list of extensions>`  
  The currently valid extensions are:

  * `XFrozen`
    * Adds a variable modifier `frozen`, which causes the LHS of an assignment to be evaluated _only once_. it is only valid in assignments.
  * `XPureLambda`
    * Memoizes lambda expressions that are detected to be pure \(side-effect free\)
  * `XNakedAsmBlocks`
    * Allows insertion of assembly code inside a block specially denoted such [more on this in [Inline Assembly Blocks](#inline-assembly-blocks.md)



[<- Prev](control-flow.md) [Next ->](scratchpad.md)