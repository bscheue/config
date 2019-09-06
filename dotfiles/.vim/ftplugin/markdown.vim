setlocal conceallevel=2
let &makeprg='pandoc % -o ' . expand('%:t:r') . '.pdf'
