# mk-greet a user defined command to   return a greeting closure
def mk-greet [name: string msg = "Howdy"] {
  {|| echo $"Hello, ($name)\n($msg)\n"l }
}
