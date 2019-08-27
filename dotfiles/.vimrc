" vim:foldmethod=marker
" mappings {{{
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

" improve buffer jumping
nnoremap gbb :ls<CR>:buffer<Space>
nnoremap gbs :ls<CR>:sbuffer<Space>
nnoremap gbv :ls<CR>:vertical sbuffer<Space>

" toggle between alternate buffer
nnoremap <BS> <C-^>
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
endfunc

" Strip whitespace from end of lines when writing file
function! StripTrailingWhitespace()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfunc
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

set number " add line numbering

augroup prewrite
  autocmd!
  autocmd BufWritePre * :call StripTrailingWhitespace()
augroup end

set cul!

if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    try
      let &t_SR = "\<Esc>]50;CursorShape=2\x7"
    catch
    endtry
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" for italic markdown and latex
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

augroup cursorshape
  autocmd!
  " need this to start with block cursor shape
  autocmd VimEnter * silent exec "! echo -ne '\e[1 q'"
  " to clear message from previous command
  autocmd VimEnter * echo ""
augroup end

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
set statusline+=\ %t\%*
set statusline+=\ ››
set statusline+=\ %#keyword#
set statusline+=\ %2y
set statusline+=\ %m
set statusline+=\ %r
set statusline+=%=
set statusline+=%#variable#
set statusline+=\ ‹‹
set statusline+=\ %4l
set statusline+=\ /
set statusline+=\ %L,
set statusline+=\ %3c
set statusline+=\ ::
set statusline+=\ %3p
set statusline+=\ %%
set statusline+=\ ››\ %*

" disable audio and visual bells
set noerrorbells
set novisualbell
set vb t_vb=

set formatoptions+=j
set complete-=i

set foldopen+=jump
" }}}
" plugins {{{
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
   command! Gwc Gwrite | Gcommit
Plugin 'tpope/vim-repeat'
Plugin 'bscheue/vim-unimpaired'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-commentary'
  " comment current line and add new copy
  nnoremap <Leader>c :t.<CR>k:Commentary<CR>j

Plugin 'mbbill/undotree'
  nnoremap <Leader>u :UndotreeToggle<CR>

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
  imap <C-J> <Plug>snipMateNextOrTrigger
  smap <C-J> <Plug>snipMateNextOrTrigger

Plugin 'bscheue/apprentice'

Plugin 'machakann/vim-swap'
  omap i, <Plug>(swap-textobject-i)
  xmap i, <Plug>(swap-textobject-i)
  omap a, <Plug>(swap-textobject-a)
  xmap a, <Plug>(swap-textobject-a)

Plugin 'junegunn/rainbow_parentheses.vim'
  nnoremap <Leader>r :RainbowParentheses!!<CR>

Plugin 'romainl/vim-qf'
  let g:qf_auto_resize = 0

Plugin 'christoomey/vim-tmux-navigator'

Plugin 'markonm/traces.vim'

Plugin 'tommcdo/vim-lion'

call vundle#end()

try
  packadd! matchit
catch
endtry

let g:netrw_liststyle=3

colorscheme apprentice
" }}}
