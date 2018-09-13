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

# Generators

Generators are lazy list generators, they have a few helpful basic functionalities as well.

`Number..Number` and `Number..Number..Number` exists as a literal \(see example\)

### Example

```ruby
# You can make a simple step generator with numbers:
var gen0 is 0..10. # => [StepGenerator]
# With a step value
var gen1 is 0..2..10. # => [StepGenerator]

# Or through messages to Generator
var gen2 is Generator from: 0 to: 10.
var gen3 is Generator from: 0 to: 10 step: 2.
var gen4 is Generator repeat: Nil. # This will just make `Nil's forever, it's useful to map
var gen5 is Generator elementsOf: [1,2,3,4]. # Makes a generator from a collection (Array,Map,String)

# You can get the next value
gen0 next. # => 0
gen0 next. # => 1

# You can map them to a new generator
var gen6 is gen0 fmap: \:x x + 3.
# Note that advancing one will advance the other too
gen6 next. # => 5
gen0 next. # => 3

# You can return a generator from a mapping, and `inext' will expand it
var gen7 is gen4 fmap: \:_ gen0 copy. # make the elements of gen0. forever.

gen7 inext. # => 4
gen7 inext. # => 5
(1..10) fmap: \:_ gen7 inext, toArray. # => Array ← 6 ; 7 ; 8 ; 9 ; 10 ; 6 ; 7 ; 8 ; 9 ; 10

# You can break in the middle of a mapping too, which will terminate the generator
```

# List Comprehensions

Everyone likes list comprehensions, so here, you can have them too.

Literal: too many to list, take a look at the example

#### Example

```ruby
var list0 is [x,, 1..10]. # Free variables are bound in order
# => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# You can specify any number of predicates
list0 is [x,, 1..10,, (x mod: 4, = 0)]. # Only multiples of 4
# => [4, 8]

list0 is [x,, 1..10,, (x mod: 4, = 0), (x > 4)]. # only multiples of 4 bigger then 4
# => [8]

# You can do without a source too
var conditionally10 is [10,,, False]. # => []
# Note the 3 commas

var a is 10.
var list1 is [a + x,, 1..3]. # bound names stay as they are
# => [13, 14, 15]

# More than one source (Generators not supported  yet)
var list2 is [x + y,, [1,2,3], [5,6,7]]. # => Array ← 6 ; 7 ; 8 ; 7 ; 8 ; 9 ; 8 ; 9 ; 10
var list3 is [x + y,, [1,2,3], [5,6,7],, x > y]. # => []

# You can return any citron object
var dispatch is Map fromArray: [[x, {\:arg arg at: x.}],, 1..5]. # returns a 2-tuple of key and a block that calls its argument with that key
# => (Map new) put:([:Block]) at:5, put:([:Block]) at:4, put:([:Block]) at:3, put:([:Block]) at:2, put:([:Block]) at:1

# Now call it!
dispatch at: 1, applyTo: [1,2,3]. # => 2
```

# TODO: more Strings



