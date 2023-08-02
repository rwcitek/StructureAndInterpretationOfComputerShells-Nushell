# String processing

## Abstract

Nushell also has many string processing primitives and commands.
In addition to filters, substring operations and searching operations,
Nushell also supports many types of literal string notations.


- Convert to CammelCase


```sh
echo "hello-world" | str camel-case

helloWorld
```


## String notations

There are basically 4 types of  of string notation:

- bare strings : Like in Bash
- single quoted strings
- Double quoted strings
- Interpolation strings



## An example of an Interpolation string

```sh
let my-string = $"The current date is (date now)\n"
print $my-string
```



Note the '$" ... "' 
Also, the expression within: '(date now)'
Like Bash: "The date is $(date)\n"
