let mapleader = " "

inoremap jj <Esc

noremap <silent> k gk
noremap <silent> j gj
noremap <silent> 0 g0
noremap <silent> $ g$
noremap <silent> ^ g^
noremap <silent> _ g_

xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
    echo "@".getcmdline()
      execute ":'<,'>normal @".nr2char(getchar())
endfunction

nnoremap <Leader>n <Esc>:nohlsearch<CR>

" for split pane navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-l> <C-w>l
nnoremap <C-k> <C-w>k
nnoremap <C-Left> <C-w><
nnoremap <C-Right> <C-w>>
nnoremap <C-Up> <C-w>+
nnoremap <C-Down> <C-w>-

" make it easier to split line in normal mode
nnoremap <silent> <leader><CR> i<CR><ESC>

nnoremap <silent> Y y$

command! MakeTags !ctags -R .
" move working directory to the directory of the current file
command! Here lcd %:p:h
" fold away lines that are the same between files
command! Onlydiff setlocal diff foldmethod=diff scrollbind nowrap foldlevel=1

