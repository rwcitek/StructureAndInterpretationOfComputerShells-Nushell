# Errata

Mistakes were made but not by. Wait, no that's not right. Were made by me.
Following is a list of mistakes I made in the session.

## $1, $2 and $3 are actually legitamate variable names


When asked a question about variable names like $1, $2 etc, I thought that Nushell will 

generate a syntax error. It does not, but does generate a runtime error if the
variable has not been defined.



```sh
# try to hide the $1 in a block that is not immediately run
let f = { echo $1 }

Error: nu::parser::variable_not_found

   Variable not found.
   [entry #3:1:1]
 1  let f = { echo $r }
                   
                     variable not found. 
   

```


But you can define the variable. Warning this looks weird:

```sh
let 1 = 33
echo $1
33
```




The previous attempt failed because the value of $1 had not been assigned yet
and when the block was being created, the $1 is not  yet in scope, so it bombs
out with a runtime error.