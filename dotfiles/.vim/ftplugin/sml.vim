setlocal errorformat=%f\:%l.%c-%*[0-9].%*[0-9]\ %tRROR:\ %m
setlocal errorformat+=%f\:%l.%c-%*[0-9].%*[0-9]\ %tARNING:\ %m,%-G%.%#
if filereadable("sources.cm")
  setlocal makeprg=rlwrap\ sml\ -m\ sources.cm
else
  setlocal makeprg=rlwrap\ sml\ %
endif
