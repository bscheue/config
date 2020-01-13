setlocal conceallevel=2
let &makeprg='pandoc % -o ' . expand('%:t:r') . '.pdf'

" jump sections
noremap <buffer> <silent> ]]
   \ :call search('^#', '')<CR>
noremap <buffer> <silent> [[
   \ :call search('^#', 'b')<CR>

nnoremap <space><space>t :0read ~/.vim/skeleton/skeleton.md<CR>Go<ESC>
