# Working with data in Nushell

## Abstract

Nushell employs the functional programming paradigm in that it uses commands that work over data.

## Source of examples

[Current U.S. Legislators in JSON]( https://theunitedstates.io/congress-legislators/legislators-current.json )

```sh
http get https://theunitedstates.io/congress-legislators/legislators-current.json |
save legislators.json
```
## Getting the first 5 names

```sh
open legislators.json | take 5 |  get name

 #    first       last        official_full       middle    nickname   suffix 
 0   Sherrod    Brown      Sherrod Brown            ❎         ❎        ❎   
 1   Maria      Cantwell   Maria Cantwell           ❎         ❎        ❎   
 2   Benjamin   Cardin     Benjamin L. Cardin     L.           ❎        ❎   
 3   Thomas     Carper     Thomas R. Carper       Richard      ❎        ❎   
 4   Robert     Casey      Robert P. Casey, Jr.   P.        Bob        Jr.    
```

### Getting the names and bios

In this example, the Bio info is a record within each other record.

```sh
/> open legislators.json | take 1 | select name bio | to json
[
  {
    "name":
    {
      "first": "Sherrod",
      "last": "Brown",
      "official_full": "Sherrod Brown"
    },
    "bio":
    {
      "birthday": "1952-11-09",
      "gender": "M"
    }
  }
]
```

```sh
open legislators.json | take 5 | select name bio | flatten

 #    first       last        official_full        birthday    gender   middle    nickname   suffix 
 0   Sherrod    Brown      Sherrod Brown          1952-11-09   M          ❎         ❎        ❎   
 1   Maria      Cantwell   Maria Cantwell         1958-10-13   F          ❎         ❎        ❎   
 2   Benjamin   Cardin     Benjamin L. Cardin     1943-10-05   M        L.           ❎        ❎   
 3   Thomas     Carper     Thomas R. Carper       1947-01-23   M        Richard      ❎        ❎   
 4   Robert     Casey      Robert P. Casey, Jr.   1960-04-13   M        P.        Bob        Jr.    
```
[Next: Filters.md](004_Filters.md)
