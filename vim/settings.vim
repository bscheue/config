highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

filetype plugin indent on
syntax on

" I don't know why this is here, need to sheck
let g:ale_emit_conflict_warnings = 0

set textwidth=0
set mouse=a
let g:filetype_pl="prolog"
set t_Co=256 "256 color
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
  let &t_SR = "\<Esc>]50;CursorShape=3\x7" " Stay in block while replacing
  let &t_ER = "\<Esc>]50;CursorShape=0\x7" "
catch
endtry

if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
else
    let &t_SI = "\e[5 q"
    let &t_EI = "\e[2 q"
endif

set t_ZH=[3m
set t_ZR=[23m

" resize windows to be same proportion after resizing terminal
autocmd VimResized * wincmd =

set path+=** " allow finding files within subfolders

set wildmenu " allow tab completion cycling
set wildmode=longest:full,full



