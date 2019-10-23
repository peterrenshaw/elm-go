#### ELM Tools And VIM

>  name: HOWTO-install-elm-tools-with-vim.md

>  date: 2019OCT22

>  prog: pr

>  desc: HOWTO setup the necessary elm tools with elm?

>  sorc: 

>        vim elm formatting

>        <https://www.vim.org/scripts/script.php?script_id=4992>

>        <https://github.com/lambdatoast/elm.vim>

>        <https://github.com/tpope/vim-pathogen>

>        <https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim>

>        elm formatting

>        <https://github.com/avh4/elm-format/releases/tag/X.Y.Z>
>

#### Objective

To make a language in an editor readable. In this particular case it is Elm-lang and Vim.


#### Install Elm highlighting in Vim

You do not need to use node to install these scripts. You do need to know where your

   .vim install is, hint $HOME


#### Install elm.vim

* go to your .vim directory

> $ cd  $HOME/.vim


* create 'bundle' directory in the .vim dir

> $ mkdir bundle
  
* clone the elm.vim file into bundle

> $ git clone https://github.com/lambdatoast/elm.vim.git


#### Install pathogen.vim

Pathogen is a necessary evil to abstract controlling plugins. It's a good idea
because setting up the plugins is a complete PIA. 

  cf "Anyone know of Objective-J syntax highlighting in vi?"
  <https://stackoverflow.com/questions/49699/anyone-know-of-objective-j-syntax-highlighting-in-vi/613550#613550>


* go to .vim directory

> $ cd $HOME/.vim

* make autoload directory

> $ mkdir autoload

* copy pathogen.vim into the .vim/autoload directory

> $ wget https://tpo.pe/pathogen.vim
> $ cp pathogen.vim  $HOME/.vim/autoload

* open your .vimrc file

> $ vim $HOME/.vimrc

* add the following to .vimrc

> " 2019OCT22 elm - pathogen
> execute pathogen#infect()
> filetype plugin indent on

* save and exit.

* reopen a new elm file in vim to verify for errors in .vimrc


#### Install elm-format

* new trick for the day: 
  
>  -- #elmlang
>  $ elm-format src/Main.elm


* find the MAC binary
- it will vary with releases...

  <https://github.com/avh4/elm-format/releases/tag/X.Y.Z>

* untar elm-format-0.8.2-mac-x64.tar


* install in the directory with elm so the path info works

> $  sudo cp elm-format /usr/local/bin

* check the file permissions

> $ ls -laF /usr/local/bin

-rwxr-xr-x  1 root  wheel  26930032 22 Aug  2018 /usr/local/bin/elm
-rwxr-xr-x@ 1 root  wheel   5373716 21 Oct 21:54 /usr/local/bin/elm-format

* go to your favourite elm directory and see if it works
- try to reformat some elm code

> cd $HOME/work/code/codetrain/e1.0
> $ elm-format src/Main.elm

* the code should be re-formatted ever time you call elm-format!



Job done.

