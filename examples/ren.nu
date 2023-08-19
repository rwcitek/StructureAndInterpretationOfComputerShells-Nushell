# ren - like DOS ren command E.g. ren *.txt *.md
def  ren [src: glob, dest: glob] {
  let ext = ($dest | path parse).extension
  glob $src | each {|f| mv $f ($f | path parse | update extension $ext | path join) }
}
