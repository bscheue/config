if exists("current_compiler")
	finish
endif
let s:keepcpo= &cpo
set cpo&vim

if exists(":CompilerSet") != 2
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet errorformat=%f\:%l.%c-%*[0-9].%*[0-9]\ %tRROR:\ %m
CompilerSet errorformat+=%f\:%l.%c-%*[0-9].%*[0-9]\ %tARNING:\ %m
CompilerSet errorformat+=%f\:%l.%c\ %tRROR:\ %m
CompilerSet errorformat+=%f\:%l.%c\ %tARNING:\ %m

let s:sourcesfile = findfile("sources.cm", ".;$HOME")
if s:sourcesfile != ''
  execute 'CompilerSet makeprg=rlwrap\ sml\ -m\ ' . s:sourcesfile
else
  CompilerSet makeprg=rlwrap\ sml\ %
endif

let &cpo = s:keepcpo
unlet s:keepcpo
