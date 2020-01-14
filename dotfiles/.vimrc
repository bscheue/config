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
nnoremap gbb :ls<CR>:buffer<Space>
nnoremap gbs :ls<CR>:sbuffer<Space>
nnoremap gbv :ls<CR>:vertical sbuffer<Space>

" open files located in the same dir as the current file
nnoremap <space>ew :edit <C-R>=expand("%:.:h") . "/"<CR><C-z>
" find files located in the same dir as the current file
nnoremap <space>fw :find <C-R>=expand("%:.:h") . "/"<CR>**/

nnoremap <space>ff :find **/

" switch between alternate buffer
nnoremap <BS> <C-^>

" git
nnoremap <space>gd :!git diff %<CR>

" tig
nnoremap <space>ts :!tig status<CR>
nnoremap <space>tb :!tig blame %<CR>

" start new undoable edit before doing <c-u>
inoremap <C-u> <C-g>u<C-u>

" }}}
" commands {{{
" move working directory to the directory of the current file
command! Here lcd %:p:h

" display full path to directory containing current file
command! Where echo expand('%:p:h')

" fold away lines that are the same between files
command! Onlydiff setlocal diff foldmethod=diff scrollbind nowrap foldlevel=1

" commands to open a scratch buffer in a split
command! VSC vnew | setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile
command! SC new | setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile

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
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

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

set ruler  "Show bottom ruler

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

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

  set t_ZH=[3m
  set t_ZR=[23m
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_SR = "\<Esc>]50;CursorShape=2\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"

  " for italic markdown and latex
  let &t_ZH="\e[3m"
  let &t_ZR="\e[23m"
endif

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

set formatoptions+=j
set complete-=i

set foldopen+=jump

set history=1000

set wildcharm=<C-z>

set tags+=.git/tags;$HOME
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

packadd! matchit

let g:netrw_liststyle=3

colorscheme apprentice
" }}}
