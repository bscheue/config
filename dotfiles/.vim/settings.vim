highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

filetype plugin indent on
syntax on

" I don't know why this is here, need to check
let g:ale_emit_conflict_warnings = 0

set textwidth=0
set mouse=a
let g:filetype_pl="prolog"
set encoding=utf-8 "UTF-8 character encoding

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
set clipboard=unnamed  "Copy and paste from system clipboard
set lazyredraw  "Don't redraw while running macros (faster)
set wrap  "Visually wrap lines
set linebreak  "Only wrap on 'good' characters for wrapping
set backspace=indent,eol,start  "Better backspacing
set linebreak  "Intelligently wrap long files
set ttyfast  "Speed up vim
set nostartofline "Vertical movement preserves horizontal position

set number " add line numbering
set laststatus=2
" Strip whitespace from end of lines when writing file
autocmd BufWritePre * :%s/\s\+$//e

set cul!

" let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
" let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
" for ssh andrew
try
  let &t_SR = "\<Esc>]50;CursorShape=2\x7" " Stay in block while replacing
  let &t_ER = "\<Esc>]50;CursorShape=0\x7" "
catch
endtry

if exists('$TMUX')
    " let &t_SI = "\<Esc>Ptmux;\<Esc>\e[4 q\<Esc>\\"
    " let &t_SR = "\<Esc>Ptmux;\<Esc>\e[6 q\<Esc>\\"
    " let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
    " let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    " let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\e[5 q"
    let &t_EI = "\e[2 q"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" need this to start with block cursor shape
autocmd VimEnter * silent exec "! echo -ne '\e[1 q'"
" to clear message from previous command
autocmd VimEnter * echo ""

" resize windows to be same proportion after resizing terminal
autocmd VimResized * wincmd =

set path+=** " allow finding files within subfolders

set wildmenu " allow tab completion cycling
set wildmode=longest:full,full

autocmd FileType tex setlocal complete-=i

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

function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

command! Onlydiff setlocal diff foldmethod=diff scrollbind nowrap foldlevel=1

