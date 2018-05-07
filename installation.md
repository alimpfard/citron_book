# Installation

Citron is meant to be used on UNIX-like systems, and as such it does not, and _will not_ support Window.

Since Citron is at a beta stage, no precompiled binaries are provided.



##  Building From Source

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

