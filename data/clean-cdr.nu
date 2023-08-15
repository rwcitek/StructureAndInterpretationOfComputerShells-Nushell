# clean-cdr.nu replace PII data in CDR .csv files
# clean-cdr fname, calling, called 
def clean-cdr [fname: string, calling: string, called: string] {
  open $fname | update "Calling #" $calling | update "Called #" $called | to csv | save $"($fname).clean"
}
