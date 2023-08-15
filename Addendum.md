# Addendum

## Abstract

Random bits of Nushell code used to create the sldes and other content from
various sources

## clean-cdr.nu

this Nu script removes PII (Personal Identifying Information) from 
call detail records downloaded from a VOIP provider

It just opens a .csv file, updates 2 columns with the calling and called ph #s
supplied with the parameters and recreates the .csv with the new filename: fname.clean

```sh



# clean-cdr.nu replace PII data in CDR .csv files
# clean-cdr fname, calling, called 
def clean-cdr [fname: string, calling: string, called: string] {
  open $fname | update "Calling #" $calling | update "Called #" $called | to csv | save $"($fname).clean"
}
```

Calling it:

```bash
nu -c 'source clean-cdr.nu; clean-cdr 01.csv "185555551212" "86665551212"'
ls 
01.csv 01.csv.clean clean-cdr.nu
rm 01.csv
```


