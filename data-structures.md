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

```py
var shoplist := Array < 'apple' ; 'mango' ; 'pure chocolate' ; 'old memes'.

Pen writeln: 'There are ' + (shoplist count) + ' items to buy.'.
Pen writeln: 'Those items are: %:L' % [' ', shoplist].

Pen writeln: 'I also want some programming socks!'.

shoplist push: 'programming socks'.

Pen write: 'Now I have to buy all of these shticks:\n'.
shoplist each: {:idx:name
    Pen writeln: '\t$$idx - $$name'.
}.

Pen write: 'Such a bad list, let me sort it first: '.
shoplist is shoplist sort: {:a:b 
    # now compare items a and b
    ^(a length) > (b length). #Whichever has a longer name last
}.
Pen writeln: '%L' % [shoplist].

Pen writeln: 'I have bought this trash now: %s, and I have these left to buy: %L' % [shoplist shift, shoplist].
```

Which should give the output

```
There are 4 items to buy.
Those items are: apple mango pure chocolate old memes
I also want some programming socks!
Now I have to buy all of these shticks:
        0 - apple
        1 - mango
        2 - pure chocolate
        3 - old memes
        4 - programming socks
Such a bad list, let me sort it first: apple, mango, old memes, pure chocolate, programming socks
I have bought this trash now: apple, and I have these left to buy: mango, old memes, pure chocolate, programming socks
```

### Tuple

Tuples are - much like other languages that have them - like immutable arrays

Their syntax is quite simple: `[ element0, element1 ]`

#### Basic example

```ruby
var zoo is ['level-headed lion', 'crazy snek', 'memeified pinguin'].
Pen writeln: 'There are %d animals in this zoo' % [zoo count].

#Any attempt at changing them deegrades them to an Array (or throws an exception)
var zoo1 is ['anime-loving pinguin'] + zoo.
Pen writeln: 'This zoo of %s is a very meme-like zoo, but this %s zoo is not!' % [zoo1, zoo]. #They retain their tuple-ness when printed literally

#as normal, degraded tuples are just arrays
Pen writeln: zoo1 pop.

#But don't even try to pop something off them or such
Pen writeln: zoo pop.
```

### Output

```
There are 3 animals in this zoo
This zoo of Array ← 'anime-loving pinguin' ; 'level-headed lion' ; 'crazy snek' ; 'memeified pinguin' is a very meme-like zoo, but this ['level-headed lion', 'crazy snek', 'memeified pinguin'] zoo is not!
memeified pinguin
Uncaught error has occurred.
Cannot change immutable array's structure
#2 pop (test.ctr: 12)
#1 writeln: (test.ctr: 12)
```

## Map

Maps are implemented as HashMaps, and respect the hash method provided by the object `object::'iHash'`

They do not have any literals associated with them.

##### Example

```ruby
#They can be either constructed with Map::'put:at:'
var map is Map new put: 'World' at: 'Hello', put: 'Fish' at: 'Dead'.
#Or with Map::'cnew:'
var map1 is Map cnew: {
    Hello => 'World'.
    Dead => 'Fish'.
}.
#Or with Map::'fromArray:'
var map2 is Map fromArray: [
    ['Hello', 'World'],
    ['Dead', 'Fish']
].
Pen writeln: 'They serialize upon printing by default:\n' + map.

# You can add, modify, or remove assocs
map put: 'Guy' at: 'Dead'.
#That's sad
map deleteAt: 'Dead'.

#They can contain any object that implements iHash
map put: 1 at: 2, put: '1' at: 3, put: map at: 4. #Even themselves

Pen writeln: map.

#They can be iterated over:
map each: {:key:value
    Pen writeln: '%s, %s' % [key, value].
}.

#Or mapped to a map with different values
map2 is map fmap: \:key:value key + ', ' + value.

Pen writeln: map2.
```

#### Output

```
They serialize upon printing by default:
(Map new) put:'Fish' at:'Dead', put:'World' at:'Hello'
(Map new) put:':selfReference:' at:4, put:'1' at:3, put:1 at:2, put:'World' at:'Hello'
4, (Map new) put:':selfReference:' at:4, put:'1' at:3, put:1 at:2, put:'World' at:'Hello'
3, 1
2, 1
Hello, World
(Map new) put:'Hello, World' at:'Hello', put:'2, 1' at:2, put:'3, 1' at:3, put:'4, (Map new) put:\':selfReference:\' at:4, put:\'1\' at:3, put:1 at:2, put:\'World\' at:\'Hello\'' at:4
```

# Set

Sets are implemented basically as Maps, without values \(they have a fixed value, which is shared between all sets\).

No literals.

#### Example

```ruby
# HashSet
import Library/Data/Set/HashSet: 'HashSet'.
# or as 'Set':
# import Library/Data/Set/HashSet: { HashSet => 'Set'. }

var set is HashSet new. # => {}
set add: 1, add: 2. # => {2, 1}

# Or maybe if you have a bunch
set addAll: ['test', 3]. # => {3, 'test', 2, 1}

# Remove an element
set remove: 'test'. # => {3, 2, 1}

# Check if an element exists
set contains: 'test'. # => False

# Bloom Filter
import Library/Data/Set/BloomFilter: 'BloomFilter'.

# These sets are neat, they provide a definite not-existence answer only
# That is, you cannot retrieve data from them, nor can you reliably remove data from them
# But they only contain a Number, and can be a fast low-confidence filter

var bf is BloomFilter new.
bf add: 'test', add: 'something else', add: 64. # => [BloomFilter]

bf contains: 4. # => False
bf contains: 'test'. # => True

```



# TODO: Sets, Generators, more Strings, maybe mention Iterators



