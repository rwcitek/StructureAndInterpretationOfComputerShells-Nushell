# How to slice and dice all the things


## Not your granpappy's ls

```sh

>>  ls examples
 #             name              type   size     modified   
 0   examples/add2.nu            file    64 B   2 weeks ago 
 1   examples/current-time.nu    file   115 B   3 days ago  
 2   examples/head-date.nu       file    86 B   a week ago  
 3   examples/mk-greet.nu        file   153 B   2 weeks ago 
 4   examples/my-cmd.nu          file   111 B   6 days ago  
 5   examples/my-in.nu           file    99 B   6 days ago  
 6   examples/test-mk-greet.nu   file   102 B   2 weeks ago 
 7   examples/update-col.nu      file   112 B   4 days ago  
 8   examples/utils.nu           file   119 B   5 days ago  
```


We see that ls returns us structured data which is then displayed in a tabular format.

We can always get back to the original system ls by preceding it with the '^' caret.

```sh
>>> ^ls examples
add2.nu     head-date.nu  my-cmd.nu  test-mk-greet.nu  utils.nu
current-time.nu  mk-greet.nu   my-in.nu   update-col.nu
````


There is even the long form of ls:

```sh

thor nushell >>  > ls -l examples/
 #         name          type   target   readonly     mode      num_links   ... 
 0   examples/add2.nu    file            false      rw-r--r--           1   ... 
 1   examples/current-   file            false      rw-r--r--           1   ... 
     time.nu                                                                    
 2   examples/head-dat   file            false      rw-r--r--           1   ... 
     e.nu                                                                       
 3   examples/mk-greet   file            false      rw-r--r--           1   ... 
     .nu                                                                        
 4   examples/my-cmd.n   file            false      rw-r--r--           1   ... 
     u                                                                          
 5   examples/my-in.nu   file            false      rw-r--r--           1   ... 
 6   examples/test-mk-   file            false      rw-r--r--           1   ... 
     greet.nu                                                                    7   examples/update-c   file            false      rw-r--r--           1   ...      ol.nu                                                                       8   examples/utils.nu   file            false      rw-r--r--           1   ... thor nushell >>  > 
```

## Counting the elements in a stream

```sh
ls | length
24
```

## Get the nth row from a table

```sh
>>> ls | select 4

 #         name         type    size     modified  
 0   005_DataTypes.md   file   2.4 KB   4 days ago 
```

Note: the select returns a new table.



## Getting only the directories

```sh
>>> ls | where type == dir

 #     name     type    size     modified   
 0   data       dir    4.1 KB   4 hours ago 
 1   examples   dir    4.1 KB   3 days ago  
 2   tmp        dir    4.1 KB   3 days ago  
```



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


Note: The use of the 'save' command  to store our transformed data into a .nuon file.

Note the use of:

1. The $r is the entire record (one line of the input) and we use dot path notation to access the current value of Date/Time or Duration
2. We use the 'into' command to convert our reformatted string into the Nushell datatype

### Optimizing our source code

Brief diversion on   the 'from' and 'to' commands

In addition to the open and save commands, if you get data from another source
that is not a file, you can use the 'from' command to convert it the same way
'open' does for files.

E.g. the 'git log' command does not give us computer friendly output, rather
human friendly one. But we can use the 'jc' command to convert it first into
JSON. then the 'from json' command to  NUON.

```sh
-log | from json | select 0
 #                commit                  author         author_email       ... 
 0   b2e9f160307a604d0da98cd834886063   Ed Howland   ed.howland@gmail.com   ... 
     0e84c2c5                                                                   
```



In addition to the 'from' command is the 'to' command which does the opposite.
exercise left for the reader.



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


## Final cleanup

Let's create a timebox to filter our dataset between 2 values



## Now we can really get cooking with gas!

```sh
source timebox-cdr.nu
source only-robots.nu

>>> let jul1 = 2023-07-01
>>> let jul31 = $jul1 + 30day

>>  > open `01.nuon` | timebox $jul1 $jul31 | length
246
>>  > open `01.nuon` | timebox $jul1 $jul31 | find-robots  | length
213
````


[Next: FinalThoughts.md](009_FinalThoughts.md) [Prev: Scripts.md](007_Scripts.md)

[Table of Contents](toc.md)
