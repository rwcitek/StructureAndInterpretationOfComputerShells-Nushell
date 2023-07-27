# Changes Nushell makes to redirection

## Abstract


Nushell reserves the '<' and '>' symbols for numerical less than and greater than
operators. Instead, Nushell relies heavly on the pipe operation:

```
echo hello world | save hello.txt
```


## Standard error and appending

```sh
echo foo | save --stderr file.err
ls | save --raw ls.raw
```

