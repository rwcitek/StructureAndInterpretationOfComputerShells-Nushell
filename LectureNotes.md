# Lecture Notes

## What is Nushell?

Nushell is a shell like many other shells you might have used. E.g. Bash, Zsh
Fish and even the stalwart sh or Bourne shell.
But Nushell is also unlike any other shell as well.
In fact, the designers of Nushell are rather proud of the fact that Nushell
is not a POSIX shell. Your existing scripts and your muscle memory are not
going to be able to help you with Nushell.


## What makes Nushell so different?


Nushell fully embraces the Unix philosophy of connecting small special purpose
tools together to build out larger  programming tasks. Where Nushell differs
is in that it does not restrict the types of data that flows through these
pipelines to just line-oriented text streams.
The modern OS environment needs to interact with many more kinds of
data like JSON, CSV and YAML, to name just a few.
Nushell can process all these formats and the code to do so looks the same
across many types of data streams.


Nushell uses the concept of structured data over than regular text streams.
This, then opens up the   much wider array of slicing and dicing tools.
We are about to see some of these in practice shortly.

## Tonight's agenda

Robert and I are going to ping pong  between my talking about a Nushell topic
and him actually doing a live demo in a screen sharing session.


## Not your grandpappy's ls

Let's start with 
>>> Over to Robert >>>

## Opening many types of file formats

Besides the built-in tools like ps, ls and sys, Nushell gives us the 'open' command.
Think of the 'open' command as redirecting stdin from a file on disk.
But, it also will convert the detected file format into Nushell's preferred
internal format: NUON, or Nu Object Notation. More on this later.



>>> Over to Robert >>>




## The 'from' command and the 'to' command

'from' is like  'open' in that it can take data from any input stream in many
types of formats and convert them into NUON for further data wrangling.
Then, the 'to' command can take NUON and convert it into other types of data
formats for either further processing or saving or streaming.


## Updating a column

We need to change the data type of our Date/Time and Duration columns so that they
are compatible data types for Nushell. Right now they are just strings.

We use the update command with 2 parameters:

- The name of the column
- A closure that gets executed on every roe.



>>> Over to Robert >>>





## Cleaning up our code


Doing this every time is cumbersome. Let's alias those update commands into the following aliases:

- u-datetime
- u-dur

Then lets save them in a file called: aliases.nu and then source that file.



>>> Over to Robert >>>




## Ok, let's actually get to the slicing and dicing!

We'll create 2 functions.

1. timebox : limit the records between 2 dates
2. find-robots : Limit the result to those where the Duration column is less than or equal to 1.1 minute.


>>> Over to Robert >>>



## Final thoughts

we could take this further. Say, we could use the  sort-by command to find
callers by their phone number. However, this data here is sanitized.

We hope we have given you a taste of Nushell. Check out the Links.md for
links to all the stuff.
