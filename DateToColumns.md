# Get the columns of the date record

## Abstract

The 'date now' command defaults to a human readable format. But it can be converted into a record for further pipelineing.

```sh
/> date now

Tue, 08 Aug 2023 06:07:38 +0000
```

```sh
/> date now | date to-record | columns

0   year       
1   month      
2   day        
3   hour       
4   minute     
5   second     
6   nanosecond 
7   timezone   
```

```sh
/> date now | date to-record

year         2023      
month        8         
day          8         
hour         6         
minute       8         
second       33        
nanosecond   964626844 
timezone     +00:00    
```

```sh
# get the hour
/> date now | date to-record | get hour
6
```
