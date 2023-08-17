# only-robots.nu filter out the possible hangups and robo calls
def find-robots [limit = 1.1min] {
  where Duration <= $limit
}
