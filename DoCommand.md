# The do command to run a closure with pipeline support

## Abstract

Closures in Nushell can capture their closing environment scope.
Since closures are first class citizens, they canbe be saved in a variable,
passed to a function and returned from a function.


### Creating our first closure

This, admittedly contrived example, should illustrate the concepts.


```sh
# mk-greet a user defined command to   return a greeting closure
def mk-greet [name: string msg = "Howdy"] {
  {|| echo $"Hello, ($name)\n($msg)\n"l }
}
```

#### No let's actually run the closure we just created:

```sh
let my-closure = (mk-greeter Frank)
do $my-closure
Hello, Frank
```




Note: we use the 'do' command to actually run our closure. We also use 'do'
from within a function to run a closure we have been passed.

## Reference
[https://www.nushell.sh/commands/docs/do.html](https://www.nushell.sh/commands/docs/do.html)
