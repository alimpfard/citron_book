## Control Flow

There are pretty much _no_ keywords in citron, thus all control flow operations are carried out by interfacing the `Boolean` Object type.

### The equivalent to a if-else structure

The method is `Boolean::'either:or:'`, alternatively, when one of the two branches is not needed, you may use `Boolean::'ifTrue:'` or `Boolean::'ifFalse:'`

All of these take a block of code \(in a basic form, code contained in `{` and `}`\), and execute it if their condition is matched.

##### An example

```ruby
var a is 123.
a > 5 either: { 
    Pen writeln: '$$a is a big number!'. 
} or: { 
    Pen writeln: '$$a is a cute little number!'. 
}.
```

Should you return a value from the `either:or:` blocks, the whole expression will evaluate to that value.

However, remember that returning from `ifTrue:` or `ifFalse:` will return **two** leves instead of one.

### Loops

Again, no keywords, so looping is achieved through interfacing Number \(a for loop\), or a block \(a while loop\).

#### Repeating an expression

`Number::'times:'` to the rescue!

That method will run the given block with the iteration index.

```ruby
10 times: {:value
    Pen writeln: value.
}.
```

#### Looping over a range

`Number::'to:step:do:'` is a basic way of looping over a range.

```ruby
5 to: 50 step: 5 do: {:value
    Pen writeln: value.
}.
```

#### While loops

To achieve a while loop, use `CodeBlock::'whileTrue:'` or `CodeBlock::'whileFalse:'`

```ruby
var a is 123.
{^a sin > 0.} whileTrue: {
    Pen write: a + ' '.
    a -=: 1.
}.
```

### Break/Continue

Simply use `Boolean::'break'` or `Boolean::'continue'`

Should the given boolean be true, they will break/continue the loop.

### Iterating over collections

Most if not all collections support these methods \(if applicable\)

* `each:` Simply iterates over the container, passing index\(key\), value, collection
* `each_v:` Iterates over the container, but only passes value, collection
* `fmap:` Iterates over the container, and replaces the element it has passed with the return value. passes only value
* `imap:` Iterates over the container, and replaces the element it has passed with the return value. passes index, value

```ruby
var arr is Array < 10 ; 20 ; 30 ; 40 ; 50.
arr fmap: {:x ^x + 2.}. # => Array < 12 ; 22 ; 32 ; 42 ; 52
arr imap: {:i:x ^x + i.}. # => Array < 10 ; 21 ; 32 ; 43 ; 54
arr each: {:i:x Pen writeln: 'Index $$i = $$x'. }. # => returns arr, prints a bunch of stuff

var map is Map fromArray: [ ['Test', 'test'], ['KEY', 'key'], [[], 'Whoa'], [1234, []] ].
map fmap: {:value ^value toString reverse.}. # => (Map new) put:'tseT' at:'Test', put:'YEK' at:'KEY', put:'][' at:([]), put:'4321' at:1234
map each: {:key:value Pen writeln: '$$key = $$value'.}. # => returns map, prints a bunch of lines
```
