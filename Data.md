# Working with data in Nushell

## Abstract

Nushell employs the functional programming paradigm in that it uses commands
that work over data. 

## Source of examples

[Current U.S. Legislators in JSON](https://theunitedstates.io/congress-legislators/legislators-current.csv)

## Getting the first 5 names

Note: we need to take the column header into account

```sh
open legislators.json | take 6 |  get name

 #    first       last         official_full       middle    nickname   suffix 
 0   Sherrod    Brown       Sherrod Brown                                
 1   Maria      Cantwell    Maria Cantwell                               
 2   Benjamin   Cardin      Benjamin L. Cardin     L.                      
 3   Thomas     Carper      Thomas R. Carper       Richard                 
 4   Robert     Casey       Robert P. Casey, Jr.   P.        Bob        Jr.    
 5   Dianne     Feinstein   Dianne Feinstein                             
```


### Getting the names and bios

In this example, the Bio info is a record within each other record.

```sh
open legislators.json | take 6 | select name bio | flatten
```

