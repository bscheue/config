highlight conceal ctermfg=green ctermbg=NONE

" Fix wonky highlighting for => operator and add type arrow
syntax match smlOperator  "=>\|->"

" Highlight type variables
syntax match smlType "'\<\w\+\>"

syntax keyword smlKeyword  rec as

syntax match smlKeychar /\<o\>\|\$\|<|\|:/

