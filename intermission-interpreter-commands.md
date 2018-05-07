## Interpreter Commands

The interactive interpreter supports many commands just like `:q`

These are called _metacommands_ and you may see the default commands by simply evaluating `:`

```
⠭⠕ :
Interpreter metacommands help:
      + q -- Quit
      + t <expression> -- type of expression
      + server [<port>] -- make an eval server on port <port>, or a random port.
      + !server -- kill the eval server
      + !m <expression> -- evaluates and shows the methods of expression.
      + !p <expression> -- evaluates and shows the properties of expression.
      + !f <[no-]flag> -- modifies flag
      + set <(+|-)flag> -- alternative for !f with easier(?) syntax
      + !def <name> <expression> -- create a metacommand
      + p <expression> -- prints the value of expression
      + c -- clear screen and history
      + h -- show this help
      - ! <cmd> -- execute shell command
      - %{ stmt* %} -- block expression ('%{' and '%}' will not be echoed)
User-defined commands:
      -None-

```

Most of these commands are useful utilities provided for fun and profit.

Try to play with some of them!



