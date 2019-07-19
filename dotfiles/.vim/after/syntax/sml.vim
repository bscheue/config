syntax match smlOperator  "=>\|->"

" Highlight type variables
syntax match smlType "'\<\w\+\>"

syntax keyword smlKeyword rec as

" highlight operators not typically highlighted
syntax match smlKeychar /\<o\>\|\$\|<|\|:/

