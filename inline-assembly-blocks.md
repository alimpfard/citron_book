## Inline assembly blocks

Just as every other decent high-level language \(not\), Citron supports inline assembly blocks \(and it can treat them as pretty much normal blocks\)

To use this feature, you must enable the `XNakedAsmBlock` parser pragma.

Then, the syntax is as follows:

```ctr
'{' 'asm' [dialect] {argument-types-or-names} (register-constraints) {assembly code} '}'
```

Where `dialect` can be any of `intel`, `att`, `at&t`, or nothing at all \(defaults to at&t\);

The argument types are typical citron arguments where the name optionally denotes the type \(in such cases where the name is not recognised, the type is assumed to be `double`\)

Recognised argument types:

* `int`: a normal 64 bit integer
* `dbl`: a double precision real value
* `str`: a pointer to an array of characters

the return type is _always_ a 64bit integer \(or whatever the default size of the native output register is\)

The register constraints are modelled exactly after LLVM's inline assembly expressions, so it is worth reading up on their documentation; however, here is the gist:

* constraints are separated with commas
* Each is a code describing one output, input, or clobbered register
  * output codes start with `=`
    * They can optionally be prefixed with `&` to be marked early clobbered
  * input codes have no prefix
  * clobber codes start with `~`
* The code itself is any one of the following formats
  * one constraint character
    * The most common are `r` \(register\) and `m` \(memory\)
  * '{' register-name '}'
    * example: `{rax}`
  * constraint constraint
    * to allow for alternatives
    * example: `{rax}m`: either allocate `%rax`, or fallback to memory
  * There must be exactly as many input constraints as there are arguments; any deviation will simply cause either a segfault or a comptime error

The assembly code can then refer to the constrainted registers/memory locs by their index in the constraint list: `$<index>` 

For example, if the constraint list is `(={rax},m,r)`, to address the first input \(the memory\), `$1` can be used.

Note that because of this templating system, number literals in at&t syntax must be prefixed with two `$`, not one \(`$$0x10`\)

### Example

```ctr
#:language XNakedAsmBlock

var native-fn is {asm intel :int (={rax},r)
    add $1, $1 # double the input
    mov $0, $1 # put it in the output
}.

# Now you can treat `native-fn' as any boring old code block
native-fn applyTo: 4. # => 8
```



