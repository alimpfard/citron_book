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

+ Unary `+`
    + Adds something to a number
        + Normally operates on Strings and Numbers
    + `3 + 5` gives `8`. `3 + 'test'` gives `'3test'`
        + Note that in no possible scenario a string would be implicitly cast to a number.

+ Unary `-`
    + Subtracts a number from another
    + `10 - 8` gives `2`

+ Unary `*`
    + Multiplies a number by another
    + `2 * 3` gives `6`

+ Keyword `pow:`
    + raises a number to a numeric power
    + `2 pow: 3` gives `8`

Tip: 
    To see all the Number methods, type `:!m Number` in the interactive interpreter






