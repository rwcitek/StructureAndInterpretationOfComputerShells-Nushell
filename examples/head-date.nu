# getfirst date in file
def head-date [name] { open $name | first 1 | get date/time }
