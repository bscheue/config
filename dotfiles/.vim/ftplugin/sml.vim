compiler smlnj
let &commentstring="(*%s*)"

nnoremap <Leader>r :w <bar> term ++close <c-r>=&makeprg<CR><CR>
