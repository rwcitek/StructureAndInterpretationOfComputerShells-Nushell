# Nushell sources, sinks and transformers


## Abstract

Nushell relies heavily on the pipeline metaphor. Small lego blocks are strung
together  to form larger tasks. These commands can be grouped in the following order:

1. Sources : Commands that generate input. Either from files or internally.
2. Transformers: Commands that take input from a source and transform it somehow.
3. Sinks: Commands that maybe format the final input or convert into some file format.

Obviously, some transformers can be sinks and some sinks can be transformers.

