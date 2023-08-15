# More Nushell niceness

nucheck - syntax check .nu files and strings for evaluation

```bash
$ nu --ide-check file.nu
```

I could not get this to work in either 0.82 or 0.83

## Parallel Execution

Nushell has the ability to run some commands in parallel. Useful if you have multiple cores.

## Sequences and ranges

In addition to the normal `seq` command for ranges numerically, Nushell also has `seq char` and `seq date`
 
## Nushell http commands

## Various http commands to fetch and interact with web sites

## TODO




## Handling stdout, stderr from external command and their exit codes

Nushell needs to be able to interact with external programs and  handle the
communication that they

 generate. This is especially true with respect to standard out and standard
error (stdout, stderr).

[Handling stdout, stderr and exit codes](https://www.nushell.sh/book/stdout_stderr_exit_codes.html#stderr)

## Searching for Nushell on the Net

Sometimes the automatic suggestions in search engines get in the way. This also
effects the search results. When searching for Nushell, you will often
get results with 'nutshell' in the name. This might change in the future
after Nushell grows in popularity. In the meantime, you the '-' to filter out
thise results:

```
nushell examples -nutshell
```


## Working with the update command

When you  pass something through the update command and give it a col and a closure,
the passed in parameter is all of the columns of that row

q!vm

```sh

# update-col.nu using update whith record
let x = { foo: 0, bar: 1, baz: 2 }
$x | update bar {|i| $i.bar + 99 }
```



You get

```
╭─────┬─────╮
│ foo │ 0   │
│ bar │ 100 │
│ baz │ 2 
```

## Date/Time formats and the default configuration

Coming from Bash or other shells, you might be surprised that the default format
date/time format seems to be in relative to the current date and time. E.g.

```sh
>>> ls first 3

