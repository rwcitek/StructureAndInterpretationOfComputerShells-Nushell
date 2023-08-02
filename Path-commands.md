# Nushell path commands and globbing

##   Abstract

Nushell can parse and extract  parts of a pathname for you

## Parse path into structured data




```
echo /foo/bar/baz   |path parse
```
# # File globbing


In addition to normal '*'.txt globbing, Nushell also supports '**/*.txt'
for recurseing down through directories.
