## Library / Imports

### The import Object

Citron's answer to handling modular programs, is of course, the `import` Object.

Yes, you read that right; Object.

The basic import syntax is like so:

`import path/to/module/directory`

you may also directly import ctr files the same way:

`import path/to/file`

There are a few rules to the import mechanism:

* If a diretory is provided, there _must_ be a `main.ctr` file inside that directory
* If the path to a file is provided, it _must_ have a .ctr extension
* If a file is outside the search paths, it may be imported using absolute paths
* Only the directly exported names inside the module are imported, unless explicitly requested \(more on this later\)
* imported object will be added to the global scope of the program

You can change the name of the explicit imports by assigning them in a block \(see example below\)

### Importing something from the standard library

The standard library is not very extensive, but it does have most of the essentials.

Example:

```ruby
import Library/Data/Set/HashSet: 'HashSet'. # Will only import the object HashSet
import Library/Data/Set/HashSet: { HashSet => 'Set'. }. # Will only import the object HashSet, as `Set'
import Library/Data/Map. # Will import all the exported values in that module
import Library/Functional/PatternMatch: \*. # Will import all the values in that module
```

### Importing specific names from a module

The `import` object will try to import any name given to it in the following ways:

1. Import only the exported names: `import path/to/module`
2. Import one specific name from the module, in addition to the exports: `import path/to/module: 'whatever'`
3. Import a list of names from some module: `import path/to/module: <Array of string>`
4. Import a few names, specifying new names: `import path/to/module: { oldName => 'newName'. oldName2 => 'newName2'. }`
5. Import all the symbols in a module: `import path/to/module: \*`

    * `\*` is a Symbol, it is a kind of String that is allocated only once.



