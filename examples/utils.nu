# utils.nu : scripts/functions coming over from my Bash life
def wl [path: string] {
  cat $path | size | get lines
}

