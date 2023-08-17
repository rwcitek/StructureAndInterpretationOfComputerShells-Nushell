# Running Nushell scripts like it is 1989

## Abstract

This section contains some surprises. In Nushell, scripts are kind of a cross
between a standard shell script and a script for a programming language like
Python or ruby. (more the former than the later)

## The main function

If coming from, say Bash, you will notice the abscence of your familiar
$1, $2, $3, .. $* and $@ for input parameters. Instead, you have to define a
main function to collect these arguments as named parameters.

E.g. Say  Hi to $1

In bash, create a file called: greet.nu

```sh
cat <<'eof' > greet.nu
#!/usr/bin/env nu
# Notice we can use shebangs

def main [person: string] {
  echo $"Hi, ($person)"
}
eof
```

```bash
chmod +x  greet.nu
./greet.nu Johnny
```
```sh
Hi, Johnny
```

[Next: FinalThoughts.md](008_FinalThoughts.md)
