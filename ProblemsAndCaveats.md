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
If there were a Nushell style guide, it would make the point that custom
commands are more flexible than aliases. because you can pass parameters in
myriad ways and even type check them. When I asked this question over on the
Discord server, that is the most common response.

Another solution is to do something like this:

```sh
alias ls-len = do { ls | length }
```

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

## Problems with piping input to nu from extrnal program using the --stdin flag:

```bash
echo ls | nu --stdin -c '??? what goes here?'
```

The trouble seems to be that the  command you want to be passed into the Nushell
intepreter cannot be executed. E.g. there is no equivalent to the 'eval'
command in Bash


## Problems with duration literals

At any point you can use durations literals as values in expressions

- 2ms
- 3day
- 5wk

But these specific literals do not work:
- 5month
- 12yr
- 9dec



[Link to discord message thread](https://discord.com/channels/601130461678272522/1141069246386946079)