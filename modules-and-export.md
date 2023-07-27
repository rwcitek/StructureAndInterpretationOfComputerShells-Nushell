# Using modules and exporting things out of them

## Abstract

Nushell has the concept of modules similar to Python's modules.
You can define thins in there and selectively export them:

- aliases
- def s (custom commands: read functions)
- env : run a block and preserve its values set therein in the current scope



## Create a new module

```sh
module foo { 

}
````
