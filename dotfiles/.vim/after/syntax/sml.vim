highlight conceal ctermfg=green ctermbg=NONE

" Fix wonky highlighting for => operator and add type arrow
syn match smlOperator  "=>\|->"

" Highlight type variables
syn match smlType "'\<\w\+\>"

syn keyword smlKeyword  rec as

syn match smlKeychar /\<o\>\|\$\|<|\|:/

