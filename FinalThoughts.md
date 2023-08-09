# Wrapping up: Nushell, my thoughts

I think that Nushell has a lot of potential, but it has a way to go yet.
On their documentation pages, they claim it is a MVP (Minimum Viable Product).
Stress on the Minimum part. I ran into many problems trying to accomplish
a simple data transformation task that might be a Bash one-liner. Some of the
problems with were my lack of experience with Nushell and the proper way of
thinking.

## Thinking in Nu

Now that I've mentioned it, there is a whole chapter in the Nushell book [[Links]]
that is called "Thinking in Nu"


In addition, I've encountered many problems that one would not have occured in
a more mature product. Don't get me wrong here; Nushell does mostly work
as advertised. There will be many paper cuts along the way. YMMV.
I do, however, think it fits my brain just the right way a data/functional
programming language should look. I like many things about Nushell. Here are a few:

- Blocks, and closures are first class items
- Funtions  have named parameters and can be optionally typed
  * Can act as if it were just any other command in Nushell
- Pipelines along wih filtering
- Functional programming paradigm


In the late 80's, we were all sporting things like the Bourne shell, sed and awk.
Then along cam Perl which was  sold to us as "Why learn all those arcane syntaxes for sh, sed and awk. Perl can do everything"
But, soon came Python and Ruby. For larger projects, you need the more
power of those "proper" scripting languages.  I can see Nushell fitting
right in there between Perl and Python/ruby/Javascript. For those
moderately complex data tasks that you do not need to break out the Big Boys for.
So, go ahead and install and play around with Nushell. In fact it just might
work to  accomplish  some nifty data oriented tasks. I will not be making
it my daily driver, at least not yet. And, I'd not recommend using in production
or critical infrastructure settings.

I've tried to collect my paper cuts here: [ProblemsAndCaveats.md](ProblemsAndCaveats.md]()
