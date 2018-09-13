## Expressions and Messages

All the statements will contain one, or more expressions.

There are _no_ native operators, and all expressions are either mentions of an object, or messages sent to them.

## Messages

There are three different semantics for messages

* Unary Messages -- These are _more_ than one unicode code point long, and take no parameters, and have no colon after them.

* Binary Messages -- These are exactly one unicode code point long, or are equal to`::` , these take a single argument.

* Keyword Messages -- These are arbitrarily long names, separated by colons

Examples for each follow:

* Unary: `2 sin` or `2 toString` or `'test' reverse`
* Binary: `2 + 3` or `True | False` or `'te%st' % ['s']`
* Keyword: `2 between: 0 and: 3` or `True either: blk0 or: blk1` or `Array join: ', '`

### Basic messages for the Number objects

* Binary `+`

  * Adds something to a number
    * Normally operates on Strings and Numbers
  * `3 + 5` gives `8`. `3 + 'test'` gives `'3test'`
    * Note that in no possible scenario a string would be implicitly cast to a number.

* Binary `-`

  * Subtracts a number from another
  * `10 - 8` gives `2`

* Binary `*`

  * Multiplies a number by another
  * `2 * 3` gives `6`

* Keyword `pow:`

  * raises a number to a numeric power
  * `2 pow: 3` gives `8`

Tip:  
    To see all the Number methods, type `:!m Number` in the interactive interpreter

### Comparing two numbers

The method names are `>`, `<`, `>=:`, `<=:`, `=`, `!=:`

equality _can_ be tested with the alias method `equals:`, However, when overriding equality, only `=` must be overridden.

### Shortcuts for number manipulations

The methods `+=:`, `*=:`, `-=:`, `/=:` exist, but they change the object itself, so any instance of that object will have a different value.

```
var a is 123.
var b is a.

a -=: 3.

Pen writeln: b. #Prints 120
```

### Evaluation Order

The generic order of evaluation is

1. The receiver
2. The first argument \(if present\)
3. The second argument \(if present\)
4. and so on

Parens are treated normally.

