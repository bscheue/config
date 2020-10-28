set shiftwidth=8
set noexpandtab

nnoremap ]] :<c-u>call search('^func')<CR>
nnoremap [[ :<c-u>call search('^func', 'b')<CR>

xnoremap ]] /^func<CR>
xnoremap [[ ?^func<CR>

set formatprg=gofmt
