# Get the columns of the date record

## Abstract

The 'date now' command defaults to a human readable format.
But it can be converted into a record for further pipelineing.

```sh
date now | date to-record | columns
# get the hour
date now | date to-record | get hour
```
