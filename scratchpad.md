## Scratchpad 

The citron evaluator also ships with a neat little scratchpad, you can launch it like so:

```sh
$ citron -m scratchpad
```

Its basic functionality is to provide a neat GUI for executing and inspecting citron code.

Unlike the evaluator, it is made to allow editing and executing several lines of code \(autocomplete coming soon™\)



### Basic usage

You simply type in some code \(it even has live syntax highlighting!\) and to execute a \(selected\) chunk of code, you press F5.

And the resulting value is inserted in the next line.



### Object inspection

The scratchpad allows you to inspect an object's values and methods \(read only, no modification\)

To do so, simply send an `inspect` message to any object:

```ruby
Scratchpad inspect
```

and a new window with the properties and methods of that object will pop up

The treeview on the left first lists the inheritance chain of the object \(if any\), then a bunch of '----'s, and then the properties.

Double clicking a property will show its value in the textview on the bottom, and middle-mouse-clicking on a property will `inspect` it.

The method list on the right is only browsable at the moment.
