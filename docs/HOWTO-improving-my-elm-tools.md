#### Improving My Elm tools


>      ________                ______    
>     / ____/ /___ ___        / ____/___ 
>    / __/ / / __ `__ \______/ / __/ __ \
>   / /___/ / / / / / /_____/ /_/ / /_/ /
>  /_____/_/_/ /_/ /_/      \____/\____/ 
>

>  name: HOWTO-improving-my-elm-tools.md

>  date: 2019OCT23

>  prog: pr

>  desc: HOWTO work with elm, vim and elm-format

>  sorc: elm / formatter <https://github.com/avh4/elm-format>

>        elm / compiler <https://github.com/elm/compiler>

#### Objective

To create a work flow with the elm compiler. formatter and vim.


#### Formatting

The parent of Elm, Haskell has a nice compiler option that will format and 
pretty print your source code. Why doesn't Elm have this? Istead it uses
another bit of code, elm-format.

I want to combine the elm compiler options with the elm formatter at my leasure.
Why? Well if I have to do this manually here's what I have to do.

> $ elm-format src/hello.elm

>  elm-format src/hello.elm
> 
>  This will overwrite the following files to use Elm's preferred style:
>
>     src/hello.elm
>
>  This cannot be undone! Make sure to back up these files before proceeding.
>
>  Are you sure you want to overwrite these files with formatted versions? (y/n)

You can shorten this using a command switch:

> $ elm-format --yes src/hello.elm
> 
> Processing file src/hello.elm
>


#### Compiling

So there's a fair bit of typing with the format command what about the compile command?

> $ elm make src/hello.elm
>
> Success! Compiled 1 module. 

#### Combining Compile And Formatting

We can combine the two processes, formatting and compiling into one line:

> $ elm-format --yes src/hello.elm && elm make src/hello.elm
>
> Processing file src/hello.elm
>
> Success! Compiled 1 module


#### Combining both

But I'm lazy, I want to combine both in the shortest possible format. I also want the flexibility to 
choose. So instead of having to compile:

> $ elm make src/hello.elm

or type this to format:

> $ elm-format --yes src/hello.elm

or this if I want to compile then format:

> $ elm make src/hello.elm && elm-format --yes src/hello.elm

I wrote a simple shell script that takes in the commands and shells out to 
compile or format, compile and format in any order.

#### GO.sh

here's some use cases showing the options for compiling and formatting

>       --compile a file
>       $ ./go.sh -i src/hello.elm -c
>       File <src/hello.elm>
>       Success! Compiled 1 module.                                          
>       Status: format (0) compile (1)

>       -- format a file
>       $ ./go.sh -i src/hello.elm -f
>       File <src/hello.elm>
>       Processing file src/hello.elm
>       Status: format (1) compile (0)

>       -- compile then format
>       $ ./go.sh -i src/hello.elm -a
>       File <src/hello.elm>
>       Success! Compiled 1 module.                                          
>       Processing file src/hello.elm
>       Status: format (1) compile (1)

Have fun.




