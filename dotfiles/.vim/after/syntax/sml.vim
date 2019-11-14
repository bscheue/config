syntax match smlOperator  "=>\|->\|<=\|>="

" Highlight type variables
syntax match smlType "'\<\w\+\>"

syntax keyword smlKeyword rec as include op do

" highlight operators not typically highlighted
syntax match smlKeychar /\<o\>\|\$\|<|\|:/

