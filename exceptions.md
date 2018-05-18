## Exceptions

Exceptions in Citron are pretty much the same as all other languages; they occur when _exceptional_ things occur!



### Basic Errors

Errors can be generated with `Block::'error:'`

The interpreter itself also can generate errors for unkown keys, etc.

```ruby
⠕ Pen writenl: 'This will make an exception!'. #Note that the method name is spelled incorrectly
#=> Exception: Unknown method Object::'writenl:' was called
⠕ pen writeln: 'This will do that too'. #Misspelled 'Pen'
#=> Exception: Key not found: pen
```



