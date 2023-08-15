# current time in hours and minutes
def current-time [] { date now | date format "%H:%M" }
alias ct = current-time
