# How to slice and dice all the things

## Abstract

Nushell comes with many tools that give you the power to filter, combine and get
the stats for some input stream. Here is an incomplete collection of some of them.

## Counting the elements in a stream

```sh
ls | length
24
```

## Get the nth row from a table

```
ls | select 4
```

Note: the select returns a new table.



## Using pars to re-format a column

In the data directory, we have some CDR records of the form:



We'd like to reformat the Duration field into an actual duration type

```sh

 >>  > open `01.csv` | select Duration  | first 1 | update Duration {|e| $e.Duration | parse "{amt} {type}" } |  get Duration | flatten
 #   amt   type 
 0   2     min  
```