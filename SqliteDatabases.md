# Working with SQLite databases

## Abstract

The open command can handle sqlite database files. Then you can use  the schema
command to inspect things.

## What the schema command produces

It produces structured data like most other Nushell commands. For databases
the structure is rather nested.

Say you want to list the columns of a table:

```sh

>>  > open sites.db | schema | get tables.urls | get columns
 #   cid     name     type   notnull   default   pk 
 0   0     name       TEXT   0                   0  
 1   1     url        TEXT   0                   0  
 2   2     user       TEXT   0                   0  
 3   3     pass_cmd   TEXT   0                   0  
 4   4     notes      TEXT   0                   0  
```

