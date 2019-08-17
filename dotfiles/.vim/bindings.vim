let mapleader = " "

" for split pane navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-l> <C-w>l
nnoremap <C-k> <C-w>k
nnoremap <S-Left> <C-w><
nnoremap <S-Right> <C-w>>
nnoremap <S-Up> <C-w>+
nnoremap <S-Down> <C-w>-

" custom text objects
for char in [ '_', '.', '/', '*', '+', '-', '#', '$', '\|' ]
    execute 'xnoremap i' . char . ' :<C-u>normal! T' . char . 'vt' . char . '<CR>'
    execute 'onoremap i' . char . ' :normal vi' . char . '<CR>'
    execute 'xnoremap a' . char . ' :<C-u>normal! F' . char . 'vf' . char . '<CR>'
    execute 'onoremap a' . char . ' :normal va' . char . '<CR>'
endfor

" make it easier to split line in normal mode
nnoremap <silent> <leader><CR> i<CR><ESC>

nnoremap <silent> Y y$

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <Up> <C-p>
cnoremap <Down> <C-n>

nnoremap <Leader>m :write <bar> silent make! <bar> silent redraw! <CR>

" jump to arbitary buffer
nnoremap gbb :ls<CR>:buffer<Space>
nnoremap gbs :ls<CR>:sbuffer<Space>
nnoremap gbv :ls<CR>:vertical sbuffer<Space>

" quickly toggle between alternate buffer
nnoremap <BS> <C-^>

" move working directory to the directory of the current file
command! Here lcd %:p:h

" display full path to directory containing current file
command! Where echo expand('%:p:h')

" fold away lines that are the same between files
command! Onlydiff setlocal diff foldmethod=diff scrollbind nowrap foldlevel=1

" commands to open a scratch buffer in a split
command! VSC vnew | setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile
command! SC new | setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile
