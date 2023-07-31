# Using Nushell as a programming language

## Abstract

Coming from Bash, you will recognize both aliases and functions. Coming from 
other programing languages like Python, you will notice  concepts like
modules and the special 'main' procedure.

## Functions

In Nushell, functions are referred to as custom commands, but otherwise work
like functions in other languages like Bash and Ruby.

```sh
# define a function to return the value of adding 2 integers
def add2 [a:int b:int] { $"($a) + ($b) = ($a + $b)" }

# calling it with 3 and 5
add2 3 5
3 + 5 = 8
```

Note two things here:

1. We can add gradual types to function parameters like in TypeScript, Python and Rust
2. The use of '( ... )' to compute an expression withing the interpolated string

The pares surrounding a expression can also be used to run any Nushell code,
including string things inside a pipeline.



## Sourcing code from script files

We can place the above in a file called: add2.nu and bring in to our session
at any time with the source command

```sh
source add2.nu
add2 6 9
6 + 9 = 15
```

Or from another shell, we can call it as if it were a script in any other shell
or programming language.

```bash
$ nu add2.nu
```



And there are many more refinements to functions like optional flags,
arguments  and rest parameters. There is also documentation that can be added
that shows when users run help fn-name.

More info can be found here:

[Custom Commands](https://www.nushell.sh/book/custom_commands.html)