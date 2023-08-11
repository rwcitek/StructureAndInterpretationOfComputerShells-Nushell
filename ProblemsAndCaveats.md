# Problems I discovered with Nushell

## Abstract

Although Nushell is a complete system, as far as I can tell, it does have
some rough edges. Here I try to list some of the problems i found.
Some of these problems might be due to a mismatch between the way I think
something should work and the  intentions and philosophy of the Nushell team.


## Problems (or Bugs?)

### The glob command does not sort its output

We checked this and found that the order is the same as the 'ls -U' behaviour
which lists a directory in unsorted  order. This maybe done for performance reasons.
In many cases, you just want the file names for later processing, sorting order be damned.

The glob command takes a glob pattern like *.csv and expands it into a proper
Nu list of full pathnames. You can get it in sorted order by piping it into 
the sort command:

```sh
glob *.csv | sort
[/full/path/1.csv, /full/path/2.csv, /full/path/3.csv]
```



Note: while this might break your muscle memory,  the sort command is more flexible
with its many  more options.


## Alias command is hindered

If you try to alias a complex set of commands you will get an error telling you
that  you can only alias commands and their options and parameters.

The only way around this is to create your own custum commands.

## Documentation issues

Note: The Command reference  page See [Links.md](Links.md)
lags behind in time from the latest stable release. At the time  of writing this
Nushell was @ 0.83.1. Use the 'help' command from within Nushell to get
more current command references.

```sh
help commands
```

See  [Links.md](Links.md) for links to some of the docs.

- Broken links in the Nushell book
- Deprecated commands and no docs on what the replacement is
- Sparse entries in the Cookbook and the media gallery page.