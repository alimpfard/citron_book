## Data Structures

There are three basic builtin _native_ structures in Citron - _Array_, _Tuple_ and _Map_

which are further extended by non-native extensions - _Set_ and _Generator_

### Array

`Array` is basically a list of values, implemented as a contiguous array.

Its' elements can have any type, and it can be created literally by the `push:` method.

`Array new push: 3, push: 'test', push: Nil`

or with a shorthand:

`Array < 3 ; 'test' ; Nil`

#### Basic example

```ruby
var shoplist is Array < 'apple' ; 'mango' ; 'pure chocolate' ; 'old memes'.

Pen writeln: 'There are ' + (shoplist count) + ' items to buy.'.
Pen writeln: 'Those items are: %:L' % [' ', shoplist].

Pen writeln: 'I also want some programming socks!'.

shoplist push: 'programming socks'.

Pen write: 'Now I have to buy all of these shticks: '.
shoplist each: {:idx:name
    Pen writeln: '\t$$idx - $$name'.
}.

Pen write: 'Such a bad list, let me sort it first: '.
shoplist is shoplist sort: {:a:b 
    # now compare items a and b
    ^(a length) > (b length). #Whichever has a longer name
}.
Pen writeln: '%L' % [shoplist].

Pen writeln: 'I have bought this trash now: %s, and I have these left to buy: %L' % [shoplist pop, shoplist].
```



