if exists("current_compiler")
	finish
endif
let s:keepcpo= &cpo
set cpo&vim

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=latexmk\ -pdf\ -pv\ %

" error formatting adapted from: https://github.com/lervag/vimtex/blob/master/autoload/vimtex/compiler/latexmk.vim
" Push file to file stack
setlocal errorformat=%-P**%f
setlocal errorformat+=%-P**\"%f\"

  " Match errors
setlocal errorformat+=%E!\ LaTeX\ %trror:\ %m
setlocal errorformat+=%E%f:%l:\ %m
setlocal errorformat+=%E!\ %m

  " More info for undefined control sequences
setlocal errorformat+=%Z<argument>\ %m

" More info for some errors
setlocal errorformat+=%C
setlocal errorformat+=%C%.%.%l%m
setlocal errorformat+=%C%.%#

setlocal errorformat+=%-WLaTeX\ Font\ Warning:\ %m
setlocal errorformat+=%-WLaTeX\ %.%#Warning:\ %.%#eference%.%#undefined%.%#line\ %l%.%#
setlocal errorformat+=%-WLaTeX\ %.%#Warning:\ %.%#undefined\ references.
setlocal errorformat+=%+WLaTeX\ %.%#Warning:\ %.%#line\ %l%.%#
setlocal errorformat+=%+WLaTeX\ %.%#Warning:\ %m
setlocal errorformat+=%+WOverfull\ %\\%\\hbox%.%#\ at\ lines\ %l--%*\\d
setlocal errorformat+=%+WOverfull\ %\\%\\hbox%.%#\ at\ line\ %l
setlocal errorformat+=%+WOverfull\ %\\%\\vbox%.%#\ at\ line\ %l
setlocal errorformat+=%+WUnderfull\ %\\%\\hbox%.%#\ at\ lines\ %l--%*\\d
setlocal errorformat+=%+WUnderfull\ %\\%\\vbox%.%#\ at\ line\ %l
setlocal errorformat+=%+WPackage\ %.%#\ Warning:\ %m\ on\ input\ line\ %l.
setlocal errorformat+=%+WPackage\ %.%#\ Warning:\ %m
setlocal errorformat+=%-Z(%.%#)\ %m\ on\ input\ line\ %l.
setlocal errorformat+=%-C(%.%#)\ %m

" Ignore unmatched lines
setlocal errorformat+=%-G%.%#

let &cpo = s:keepcpo
unlet s:keepcpo
