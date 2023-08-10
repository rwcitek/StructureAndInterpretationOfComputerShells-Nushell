# Nushell Programming

## Abstract

Essentially, at its basic level, Nushell is just a scripting language.
It is fully Turing Complete. It has many built-in programming language
constructs found in other modern languages. And a few of its own making!

Nushell has support for the following additional language features not found
in other shells:

- Blocks : That contain their own scope
  * This has an effect on things like `cd dir`, remains only while block is in scope
- Closures : Lambda functions that are first class language variables and parameters.
- Higher order commands that operate over their input like `each`, `reduce`, `filter`
- Parallel execution of code.
