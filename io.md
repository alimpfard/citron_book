## IO

Everyone adores I/O, well, not everyone, that poor processor that is always kept waiting sure doesn't.

The basic input methods are available with the `Program::'input'`, `Program::'waitForInput'` and `Program::'getCharacter'` \(only available with termios\)

the more...sophisticated actions can be performed with `stdin` : `File special: 'sdin'` will give an auto-cleaning handle to it.

### Input

```ruby
var thing is Program waitForInput.
Pen writeln: 'in reverse: ' + thing reverse.
Pen writeln: 'SPACEY: ' + (thing characters join: ' ').
#This will raise an exception if any extra character remains after conversion
Pen writeln: 'Trying to make a number of it: ' + (thing toNumber).
```

Output for `123test`:

```
123test
in reverse:
tset321
SPACEY: 1 2 3 t e s t

Uncaught error has occurred.
cannot build number, extranous characters in string
#3 toNumber (test.ctr: 5)
#2 + (test.ctr: 5)
#1 writeln: (test.ctr: 5)
```

#### Palindromes, because every language needs one

```ruby
var is_palindrome is {:str
    ^str reverse = str.
}.
Pen write: 'What be your text? '.
{^True.} whileTrue: {
    Pen writeln: (is_palindrome applyTo: Program waitForInput trim, either: 'Yep, that\'s a palindrome' or: 'Nope, not a plaindrome').
}.
```



