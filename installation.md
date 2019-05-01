# Installation

Citron is meant to be used on UNIX-like systems, and as such it does not, and _will not_ support Window.

## Binaries

Basic binary builds are provided for Linux \(ELF x86\_64\) and Windows \(PE x86\_64\)  
You can get them from [the repository releases](https://github.com/alimpfard/citron/releases)

## Building From Source

Clone the git repository at [https://github.com/alimpfard/citron](https://github.com/alimpfard/citron).

To make a debug build in the main directory:

```
$ cd citron
$ make debug
```

or alternatively to make and install citron to the system:

```
$ cd citron/autohell
$ aclocal && autoconf && automake --add-missing && libtoolize
$ make && sudo make install
```

which will install the `ctr` executable, an interactive interpreter `citron` and the library and headers.

## Summary

We will now assume you have Citron installed on your system.

Give it a go with launching the interpreter `citron`



## Warning about copy/pasting code into the evaluator

Remember to put it in paste mode \(press F2\) before pasting

Exiting paste mode is just like entering it \(F2\)



[<- Prev](about-citron.md) [Next ->](baby-steps.md)
