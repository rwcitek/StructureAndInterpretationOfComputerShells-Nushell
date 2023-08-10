# Data types in Nushell

## Abstract

Nushell is more like other so-called scripting languages like Python, Ruby and
others with regard to supported internal data types than like most shells.
In most shells, the prime data type is a string, but there are adjustments
for collections like arrays and associative arrays (e.g. Hashmaps or dicts).
In some cases, shells like Bash have special syntax to handle ints and  arithmetic
expressions without having to send input to commands like bc, dc and expr.

In Nushell, all these data types are built-in and are part of the language
without needing to treat them as strings first and/or using special syntax. Morelike Python works.

In addition to data types you might expect, Nushell has some additional types that
you might find in other programming languages but you would need to pull
either a standard library or pull from the languages package manager.

E.g.

- DateTime
- Duration
- Filesize
- Lists
- Records 
- Tables

## Lists

Lists are enclosed in square brackets like arrays in other languages.
It is possible in some cases to leave out the comma separator.

```sh
[foo bar baz]
```

## Records

Records are like dicts or hashmaps in other languages.
They look like JSON object types with key values separated with a colon.

```sh
{ name: "John", age: 54 }
```

## Tables

Tables in Nushell are the bread and butter of Nushell. Many supplied commands
will generate or consume tables through the pipeline interface.


### Structure of a table

One way to think of a table is as a list of records. The columns of the 
table map onto the keys of each individual record. The rows of the table map onto
the individual record as a whole object.

E.g. A table might be thought of  as a JSON array of objects.
Indeed, actual JSON is a subset of NUON (the Nu Object Notation) format.

### An example record first

Here is a record of a name

```sh
{ first: "Mary", last: "Smith" } | get first
0: Mary
```

We use the get command to pull a value from a record given its key.


### A table example using the record from the previous example

```sh
[{ first: "John", last: "Collins"}, { first: "Mary", last: "Smith" }] | get last


 0   Collins 
 1   Smith   
```


Above, the get command will return a list of columns that  map to the key names of each record.

[NushellProgramming.md](006_NushellProgramming.md)
