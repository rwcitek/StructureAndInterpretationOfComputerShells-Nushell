# csv-nuon.nu transform .csv file into .nuon file
source aliases.nu
def csv-nuon [fname: string, ofname: string] {
  open $fname | u-datetime | u-dur | save $ofname
}
