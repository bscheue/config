compiler smlnj
let &commentstring="(*%s*)"

nnoremap <buffer> <space>r :w <bar> term ++close <c-r>=&makeprg<CR><CR>
