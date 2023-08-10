# Nushell sources, sinks and transformers


## Abstract

Nushell relies heavily on the pipeline metaphor. Small lego blocks are strung
together  to form larger tasks. These commands can be grouped in the following order:

1. Sources : Commands that generate input. Either from files or internally.
2. Transformers: Commands that take input from a source and transform it somehow.
3. Sinks: Commands that maybe format the final input or convert into some file format.

Obviously, some transformers can be sinks and some sinks can be transformers.



## Sources

The 'open' command can be used to source almost any common file format
This can be used to feed into a larger pipeline to transform it somehow.



## A common intermediate format

Nushell uses NUON (Nushell Object Notation) a variation on JSON.


NUON is also used for configuration files.


NUON is a superset of JSON. All valid JSON is valid NUON.




## SQLite databases

SQLite databases are already understood by Nushell and get automatically converted to NUON.
[Data.md](003_Data.md)
