# Filters used by Nushell

## Abstract

Out of the box, Nushell comes with a number of built-in filters. But you can
always add your own via a closure.

## Built-in filters

- get : select only column(s) from table
  * If coming from a table, returns column as a whole as a list
  * Can also select numeric index from a list
- select : Like get but returns the NUON object which is a table
- first : get the first N rows of table
- skip : Skips N rows before returning the rest of table
- drop : Drops N rows from the end of the table
- last : Gets the final N rows of table
- transpose : Rotate the table by 90 degrees. Rows become columns, columns become rows
- from : Convert data in a pipeline to NUON tables or lists or records

## Handy example of transpose

Using the legislators.json file from the Data.md page, show the column headers
one column:

```sh
open legislators.json | take 1 | transpose
```
```sh
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
open legislators.json | take 2 | get name | flatten | get last
```
```sh
 0   Brown    
 1   Cantwell 
```

## Nushell provides many SQL-like functions for inserting and updating and merging tables

You can add columns, insert rows and merge and concatenate tables.
You can also update columns.  Since most output from Nushell is table based,
this allows a lot of flexibility. Think of the hoops you'd to go through
to accomplish with the Unix tools you normally might use.

E.g.

1. Convert raw data to .csv
2. Import into a DB like sqlite
3. Use SQL statements to slice and dice

Nushell fits nicely between traditional data wranglin and more extensive
alternatives.


## Using closures

We do not have to rely on the many built-in filters that Nushell ships
out the box. One time filters can be created on the fly by using closures or
lambdas. In fact many Nushell filters like `each` and `reduce` require them.

```sh
ls | each {|e| $e | get name } | take 5
```
```sh
 0   bin  
 1   boot 
 2   dev  
 3   etc  
 4   home 
```

Although this is no different than just calling get name after ls, you can see
how to add more content to each row.

```sh
ls *.txt | each {|e| $"-->($e | get name)<--" }
```
```sh
 0   -->foobar.txt<-- 
 1   -->hello.txt<--  
 2   -->world.txt<--  
```

Notice the rather strange way to perform string interpolation.


## The from command to convert data into Nushell data

The from command takes input from some file format like csv
and converts into canonical Nushell records.
These records are now in NUON form, a superset of JSON.
The 'from' command is a filter. It is meant to be used with commnds that generate
data in other formats other than JSON or NUON, like the open command.

## FIXME - rwc: no file, no output

```sh
open file.txt | from csv
```


Once you have NUON,  you can slice and as usual in Nu commands.

Note:  You do not have to export from sqlite to .csv as Nushell handles sqlite 
files with the open command itself.


## The 'into' command

See the page: [DataTypes.md](DataTypes.md) for a more full description.

The 'into' command with its subcommands helps to transform strings
into internal data types for Nushell.

This can be handy if trying to use text from a plain text file and needing
to convert it into native Nushell data types for further processing.[DataTypes.md](005_DataTypes.md)
[Next: DataTypes.md](005_DataTypes.md) [Prev: Data.md](003_Data.md)


[Table of Contents](toc.md)
