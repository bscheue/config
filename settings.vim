filetype plugin indent on

highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

syntax on

set textwidth=0
set mouse=a
let g:filetype_pl="prolog"
set nocompatible  "Kill vi-compatibility
set t_Co=256 "256 color
set encoding=utf-8 "UTF-8 character encoding

" Indent 4 spaces
set tabstop=2  "4 space tabs
set shiftwidth=2  "4 space shift
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
set wildmode=longest,list  "Better unix-like tab completion
set clipboard=unnamed  "Copy and paste from system clipboard
set lazyredraw  "Don't redraw while running macros (faster)
set wrap  "Visually wrap lines
set linebreak  "Only wrap on 'good' characters for wrapping
set backspace=indent,eol,start  "Better backspacing
set linebreak  "Intelligently wrap long files
set ttyfast  "Speed up vim
set nostartofline "Vertical movement preserves horizontal position

set number
set laststatus=2
" Strip whitespace from end of lines when writing file
autocmd BufWritePre * :%s/\s\+$//e

syntax on

set cul!

let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
try
  let &t_SR = "\<Esc>]50;CursorShape=3\x7" " Stay in block while replacing
  let &t_ER = "\<Esc>]50;CursorShape=0\x7" "
catch
endtry

