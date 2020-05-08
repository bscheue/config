if exists("current_compiler")
	finish
endif
let s:keepcpo= &cpo
set cpo&vim

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=latexmk\ -cd\ -pdf\ -pv\ %

" error formatting adapted from: https://github.com/lervag/vimtex/blob/master/autoload/vimtex/compiler/latexmk.vim
" Push file to file stack
CompilerSet errorformat=%-P**%f
CompilerSet errorformat+=%-P**\"%f\"

  " Match errors
CompilerSet errorformat+=%E!\ LaTeX\ %trror:\ %m
CompilerSet errorformat+=%E%f:%l:\ %m
CompilerSet errorformat+=%E!\ %m

  " More info for undefined control sequences
CompilerSet errorformat+=%Z<argument>\ %m

" More info for some errors
CompilerSet errorformat+=%C
CompilerSet errorformat+=%C%.%.%l%m
CompilerSet errorformat+=%C%.%#

CompilerSet errorformat+=%-WLaTeX\ Font\ Warning:\ %m
CompilerSet errorformat+=%-WLaTeX\ %.%#Warning:\ %.%#eference%.%#undefined%.%#line\ %l%.%#
CompilerSet errorformat+=%-WLaTeX\ %.%#Warning:\ %.%#undefined\ references.
CompilerSet errorformat+=%+WLaTeX\ %.%#Warning:\ %.%#line\ %l%.%#
CompilerSet errorformat+=%+WLaTeX\ %.%#Warning:\ %m
CompilerSet errorformat+=%+WOverfull\ %\\%\\hbox%.%#\ at\ lines\ %l--%*\\d
CompilerSet errorformat+=%+WOverfull\ %\\%\\hbox%.%#\ at\ line\ %l
CompilerSet errorformat+=%+WOverfull\ %\\%\\vbox%.%#\ at\ line\ %l
CompilerSet errorformat+=%+WUnderfull\ %\\%\\hbox%.%#\ at\ lines\ %l--%*\\d
CompilerSet errorformat+=%+WUnderfull\ %\\%\\vbox%.%#\ at\ line\ %l
CompilerSet errorformat+=%+WPackage\ %.%#\ Warning:\ %m\ on\ input\ line\ %l.
CompilerSet errorformat+=%+WPackage\ %.%#\ Warning:\ %m
CompilerSet errorformat+=%-Z(%.%#)\ %m\ on\ input\ line\ %l.
CompilerSet errorformat+=%-C(%.%#)\ %m

" Ignore unmatched lines
CompilerSet errorformat+=%-G%.%#

let &cpo = s:keepcpo
unlet s:keepcpo
