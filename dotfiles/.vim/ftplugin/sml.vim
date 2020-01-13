compiler smlnj
let &commentstring="(*%s*)"

nnoremap <space>r :w <bar> term ++close <c-r>=&makeprg<CR><CR>
