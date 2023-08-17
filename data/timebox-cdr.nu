# timebox-cdr.nu time box the CDR records
# remember CDR is in reverse chrono order
def timebox [start: datetime, end: datetime] {
  where Date/Time >= $start and Date/Time <= $end
}
