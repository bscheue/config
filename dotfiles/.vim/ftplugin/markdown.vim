let &makeprg='pandoc % -o ' . expand('%:t:r') . '.pdf'

" jump sections
noremap <buffer> <silent> ]]
   \ :call search('^#', '')<CR>
noremap <buffer> <silent> [[
   \ :call search('^#', 'b')<CR>

nnoremap <buffer> <space><space>t :0read ~/.vim/skeleton/skeleton.md<CR>Go<ESC>
