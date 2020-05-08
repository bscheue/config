syntax match smlOperator  "=>\|->\|<=\|>=\|>>="

" Highlight type variables
syntax match smlType "'\<\w\+\>"

" highlight operators not typically highlighted
syntax match smlKeychar /\<o\>\|\$\||>\|:/

syntax clear smlKeyword

syn region   smlKeyword start="\<signature\>" matchgroup=smlModule end="\<\w\(\w\|'\)*\>" contains=smlComment skipwhite skipempty nextgroup=smlMTDef
syntax keyword smlKeyword and andalso case
syntax keyword smlKeyword datatype else eqtype
syntax keyword smlKeyword exception fn fun handle
syntax keyword smlKeyword in infix infixr
syntax keyword smlKeyword nonfix of orelse
syntax keyword smlKeyword raise handle type
syntax keyword smlKeyword val where while with withtype
syntax keyword smlKeyword rec as include op do sharing
