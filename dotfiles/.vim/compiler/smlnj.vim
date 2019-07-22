if exists("current_compiler")
	finish
endif
let s:keepcpo= &cpo
set cpo&vim

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet errorformat=%f\:%l.%c-%*[0-9].%*[0-9]\ %tRROR:\ %m
CompilerSet errorformat+=%f\:%l.%c-%*[0-9].%*[0-9]\ %tARNING:\ %m
if filereadable("sources.cm")
  CompilerSet makeprg=rlwrap\ sml\ -m\ sources.cm
else
  CompilerSet makeprg=rlwrap\ sml\ %
endif

let &cpo = s:keepcpo
unlet s:keepcpo
