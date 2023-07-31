# Filters used by Nushell

## Abstract

Out of the box, Nushell comes with a number of built-in filters. But you can
always add your own via a closures.

## Builtin filters

- get : select only column(s) from table
- select : Like get but returns the NUON object which is a table
- take N  - Only take the N number of rows of a table
- drop N | Drop the first N number of rows of a table
- transpose : Rotate the table by 90 degrees. Rows become columns, columns become rows

## Handy example of transpose

Using the legislators.json file from the Data.md page, show the column headers
one  column:

```sh
open legislators.json | take 1 | transpose


 0   id        {record 15 fields} 
 1   name      {record 3 fields}  
 2   bio       {record 2 fields}  
 3   terms     [table 10 rows]    
```



Note that the name field is another record that has 3 fields. (sometimes)

These fields are:

1. First
2. Last
3. official_full : The full name of the legislator

We have to flatten out this record to get more access to it:

```sh
open legislators.json | take 2 | flatten | get last
Brown
Cantrell
```



## Using closures

We do not have to rely on the many built-in filters that Nushell ships
out the box. One time filters can be created on the fly by using closures or
lambdas. In fact many Nushell filters like each and reduce require them.



```sh
ls | each {|e| $e | get name }
```

Although this is no different than just calling get name after ls, you can see
how to  add more content to  each row.

```sh
ls *.md | each {|e| $"-->($e | get name)<--" }
```


Notice the rather strange way to perform string interpolation.
