# The from command reformats data formats into nushell records or tables

## Abstract

The from command takes input from some file format like csv
and converts into canonical Nushell records.
These records are now in NUON form, a superset of JSON.

```sh
open file.txt | from csv
```




Once you have NUON,  you can slice and as usual in Nu commands.

Note:  You do not have to export from sqlite to .csv as Nushell handles sqlite 
files with the open command itself.

## Getting help on the from command and its subcommands

```sh
help from
# Get help on CSV conversions
help from csv
```
