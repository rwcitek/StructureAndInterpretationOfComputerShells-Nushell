# aliases.nu for transforming CDR .csv files
alias u-datetime = update Date/Time {|r| $r."Date/Time" | into datetime }
alias u-dur = update Duration {|r| $r.Duration | str replace ' ' '' | into duration }