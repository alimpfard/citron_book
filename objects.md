## Objects

Objects are the main attraction in Citron \(but are in no way forced\)

You may instantiate any object by the default `Object::'new'` method \(all objects should treat this method as a request for a new instance\)

or directly execute code in the newly created object instance by using `Object::'cnew:'`

Objects can interface each other _only_ by their methods \(no way to access object fields directly if said object does not expose a method for it\)

In each object's context o execution, an implicit `me` reference refers to the object itself, and the object's properties are accessible by `my` qualified references.

#### Dumb example

```ruby
var Person is Object cnew: { name => 'Dummy'. }.
#To add a method, use Object::'on:do:'
Person on: 'new:' do: {:name ^me cnew: { name => name. }. }.
Person on: 'name' do: { ^my name. }, #You are most welcome to chain these should you wish to
 on: 'greet:' do: {:other
    #just assume other responds to 'name'
    Pen writeln: 'Hello, ' + other name + ', I am ' + my name.
}. #All such methods implicitly return `me' if nothing is explicitly returned.

var p0 is Person new: 'Idiot'.
var p1 is Person new: 'Fool'.

p0 greet: p1. #p1 supports ::'name'
#let's try with something that doesn't
p1 greet: 'Semicolon'.
```

##### Dumb output

```
Hello, Fool, I am Idiot
Uncaught error has occurred.
Unknown method String::'name' was called
#4 name (test.ctr: 7)
#3 + (test.ctr: 7)
#2 writeln: (test.ctr: 7)
#1 greet: (test.ctr: 15)
```

### Inheritance

The usual single-inheritance rules apply \(only to methods, and calling the parent constructor should be _explicit_\)

```ruby
var P is Object new on: 'method' do: { ^'Parent method'. }.
var C is P new.
#Overrides have no special syntax
C on: 'method' do: { ^'Child method'. }.
Pen writeln: C method. #=> 'Child method'
```

Multiple inheritance _is_ supported, in a way.

You may 'inherit' from other objects and delegate method calls to their defintiions:

```ruby
var P0 is Object new on: 'test0' do: {^'test0'.}.
var P1 is Object new on: 'test1' do: {^'test1'.}.
var C is P0 new inheritFrom: P1.

#Now ::'test1' will properly work (it will not contain any references to P1)
C test1. #=> 'test1'
```



[<- Prev](data-structures.md) [Next ->](io.md)