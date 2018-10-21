## Interpreter Commands

The interactive interpreter supports many commands just like `:q`

These are called _metacommands_ and you may see the default commands by simply evaluating `:`

```
⠕ :
Interpreter metacommands help:
      + q -- Quit
      + t <expression> -- type of expression
      + server [<port>] -- make an eval server on port <port>, or a random port.
      + !server -- kill the eval server
      + !m <expression> -- evaluates and shows the methods of expression.
      + !p <expression> -- evaluates and shows the properties of expression.
      + !f <[no-]flag> -- modifies flag
      + hist [(<nth>)] <query> -- searches for entry in history, and returns it as a block
      + !hist [(<nth>)] <query> -- searches and executes (like hist but executes immediately)
      + set <(+|-)flag> -- alternative for !f with easier(?) syntax
      + !def <name> <expression> -- create a metacommand
      + p <expression> -- prints the value of expression
      + c -- clear screen and history
      + break <obj> <msg> -- break on object's message
      + !enable <b[reak]> -- enable option
      + h -- show this help
      - ! <cmd> -- execute shell command
      - :{\n stmt* \n:}\n -- block expression
Debug Mode commands (Currently Experimental):
      + !return <value> -- return value for this message
      + !step -- single step through messages
      + !cont -- continue
      + !frame [show, all, <id>] -- show frames
User-defined commands:
      -None-
```

Most of these commands are useful utilities provided for fun and profit.

A few useful meta commands:

* `:q` very useful, quits the evaluator
* `!hist 0 test[` execute the latest history entry that begins with `test[`
* `:t <expression>` sometimes useful, displays the type of the expression
* `:set +stats` shows statistics for each evaluation
* `:set -printvs` disables the print of results \(useful for big values\)
* `:p expression` print the value of expression
* `:! ls` I dunno, I guess you might need the file listing fast 
* `:!def wee \:args 'weeeee $$args'` these work as a fast meta-macro too

Try to play with some of them!

