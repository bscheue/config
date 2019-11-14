setlocal conceallevel=2
let &makeprg='pandoc % -o ' . expand('%:t:r') . '.pdf'

" jump sections
noremap <script> <buffer> <silent> ]]
   \ :call search('^#', '')<CR>
noremap <script> <buffer> <silent> [[
   \ :call search('^#', 'b')<CR>
xnoremap <script> <buffer> <silent> ]]
   \ :<c-u>call search('^#', '')<CR>
xnoremap <script> <buffer> <silent> [[
   \ :<c-u>call search('^#', 'b')<CR>


