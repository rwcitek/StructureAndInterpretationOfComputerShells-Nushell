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