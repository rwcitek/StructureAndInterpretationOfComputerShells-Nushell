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

In the data directory, we have some CDR records in .csv format of the form:

Date/Time,Calling #,Called #,Duration,Amount,Tax,Total,Destination,Extension
07/31/2023 17:08:33,18885551212,18665551212,2 min,$0.0000,$0.0000,$0.0000,Incoming,
```
```




We'd like to reformat the Duration field into an actual duration type
This will allow for filtering only those incoming phone calls less than 1.1
minutes. which are probably hang-ups or Robo calls.




We'd also like to transform the Date/Time column into a proper Nushell
datetime data type. This will let us focus only those calls in a given month, say.

```sh
open 01.csv
open 01.csv | update Date/Time {|r| $r."Date/Time" | into datetime } | update Date/Time {|r| $r."Date/Time" | into datetime } |  update Duration {|r| $r.Duration | str replace ' ' '' | into duration } | save 01.nuon
```


Note the use of:

1. The $r is the entire record (one line of the input) and we use dot path notation to access the current value of Date/Time or Duration
2. We use the 'into' command to convert our reformatted string into the Nushell datatype

### Optimizing our source code

Obeying the DRY principle (Do not repeat Yourself)

let's alias those update commands to make updating the .csv files easier:

```sh
# aliases.nu for transforming CDR .csv files
alias u-datetime = update Date/Time {|r| $r."Date/Time" | into datetime }
alias u-dur = update Duration {|r| $r.Duration | str replace ' ' '' | into duration }
```

Now our call looks like this:

```sh
open 01.csv | u-datetime | u-dur | save 01.nuon
```



We can dry it up further by creating a custom Nushell command (function) to do this

```sh
# csv-nuon.nu transform .csv file into .nuon file
source aliases.nu
def csv-nuon [fname: string, ofname: string] {
  open $fname | u-datetime | u-dur | save $ofname
}
```

Now call it like this:

```sh
source csv-nuon.nu
csv-nuon 01.csv 01.nuon
```


## At this point,  after cleaning up our data, let's slice and dice


```sh
>>  > open `01.nuon` | where Duration < 1.1min and Date/Time < ((date  now) - 31day) and Destination == "Incoming" | length
680
```
