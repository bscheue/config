" vim:foldmethod=marker
" mappings {{{
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
nnoremap <silent> <space><CR> i<CR><ESC>

nnoremap <silent> Y y$

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <Up> <C-p>
cnoremap <Down> <C-n>

nnoremap <space>m :write <bar> silent make! <bar> silent redraw! <CR>

" improve buffer jumping
nnoremap gbb :buffer<Space>
nnoremap gbs :sbuffer<Space>
nnoremap gbv :vertical sbuffer<Space>

" open files located in the same dir as the current file
nnoremap <space>ew :edit <C-R>=expand("%:.:h") . "/"<CR><C-z>
" find files located in the same dir as the current file
nnoremap <space>fw :find <C-R>=expand("%:.:h") . "/"<CR>**/

" switch between alternate buffer
nnoremap <BS> <C-^>

" git
nnoremap <space>gd :!git diff %<CR>

" tig
nnoremap <space>ts :!tig status<CR>
nnoremap <space>tb :!tig blame %<CR>
nnoremap <space>tl :!tig log %<CR>

" start new undoable edit before doing <c-u>
inoremap <C-u> <C-g>u<C-u>

" view register contents and set up put
nnoremap \p :<C-u>registers<CR>:normal! "p<Left>

nnoremap \i :<C-u>t.<CR>:s/1/2/g<CR>

" make it easier to use the system clipboard
nnoremap "" "+
xnoremap "" "+

" }}}
" commands {{{
" move working directory to the directory of the current file
command! Here lcd %:p:h

" display full path to directory containing current file
command! Where echo expand('%:p:h')

" }}}
" functions {{{
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction

" Strip whitespace from end of lines when writing file
function! StripTrailingWhitespace()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfunction
" }}}
" settings {{{
filetype plugin indent on
syntax on

set textwidth=0
set mouse=a

set tabstop=2  "2 space tabs
set shiftwidth=2  "2 space shift
set softtabstop=2  "Tab spaces in no hard tab mode
set expandtab  " Expand tabs into spaces
set autoindent  "autoindent on new lines

set showmatch  "Highlight matching braces

set equalalways  "Split windows equal size

set formatoptions=croq  "Enable comment line auto formatting

set title  "Set window title to file
set hlsearch  "Highlight on search
set ignorecase  "Search ignoring case
set smartcase  "Search using smartcase
set incsearch  "Start searching immediately

set scrolloff=5  "Never scroll off
set clipboard=exclude:.* "Never clobber the system clipboard unless asked to
set lazyredraw  "Don't redraw while running macros (faster)
set wrap  "Visually wrap lines
set linebreak  "Only wrap on 'good' characters for wrapping
set backspace=indent,eol,start  "Better backspacing
set linebreak  "Intelligently wrap long files
set ttyfast  "Speed up vim
set nostartofline "Vertical movement preserves horizontal position

augroup prewrite
  autocmd!
  autocmd BufWritePre * :call StripTrailingWhitespace()
augroup end

set cursorline

augroup ausize
  autocmd!
  " resize windows to be same proportion after resizing terminal
  autocmd VimResized * wincmd =
augroup end

set wildmenu " allow tab completion cycling
set wildmode=longest:full,full

set completeopt=longest,menuone,menu,preview
set omnifunc=syntaxcomplete#Complete

set laststatus=2
set statusline=
set statusline+=%#function#
set statusline+=\ %*
set statusline+=\ ‹‹
set statusline+=\ %t\%* " file name
set statusline+=\ ››
set statusline+=\ %#keyword#
set statusline+=\ %w " preview window
set statusline+=\ %m " modifiable
set statusline+=\ %r " read only
set statusline+=%=
set statusline+=%#variable#
set statusline+=\ ‹‹
set statusline+=\ %4l " current row
set statusline+=\ /
set statusline+=\ %L, " number of rows in buffer
set statusline+=\ %3c " current column
set statusline+=\ ››\ %*

" disable audio and visual bells
set noerrorbells
set novisualbell
set vb t_vb=

" if it makes sense remove comment leader when joining lines
set formatoptions+=j
set complete-=i

set foldopen+=jump

set history=1000

set wildcharm=<C-z>
set wildignore=*.aux,*.fdb_latexmk,*.fls,*.log,*.out,*.synctex.gz,*.pdf
set wildignore+=*.o

set tags+=.git/tags;$HOME

set splitright
" }}}
" plugins {{{
" for commentary (comment current line and add new copy)
nnoremap <space>c :t.<CR>k:Commentary<CR>j

" for undotree
nnoremap <space>u :UndotreeToggle<CR>

" for snipmate
imap <C-J> <Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger

" for vim-swap
omap i, <Plug>(swap-textobject-i)
xmap i, <Plug>(swap-textobject-i)
omap a, <Plug>(swap-textobject-a)
xmap a, <Plug>(swap-textobject-a)

" for rainbow parens
nnoremap \r :RainbowParentheses!!<CR>

" for romainl-qf
let g:qf_auto_resize = 0

" for vim-toggle
nmap <space>q <Plug>ToggleQfWindow
nmap <space>l <Plug>ToggleLocWindow
nmap <space>p <Plug>TogglePreviewWindow

" for traces
let g:traces_preserve_view_state=1

packadd! matchit

let g:netrw_liststyle=3

colorscheme apprentice
" }}}
