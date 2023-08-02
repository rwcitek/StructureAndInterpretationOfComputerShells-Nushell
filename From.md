# The `from` command reformats data formats into nushell records or tables

## Abstract

The `from` command takes input from some file format like CSV and converts into canonical Nushell records. These records are now in NUON form, a superset of JSON. The `from` command is a filter. It is meant to be used with commands that generate data in other formats other than JSON or NUON, like the `open` command.

```sh
open file.txt | from csv
```
#### FIXME - Should there be output?

Once you have NUON, you can slice and use as usual in Nu commands.

Note:  You do not have to export from sqlite to CSV as Nushell handles sqlite 
files with the `open` command itself.

## Getting help on the `from` command and its subcommands

```sh
help from
# Get help on CSV conversions
help from csv
```

#### FIXME - Should there be output?
