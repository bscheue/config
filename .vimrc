set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'jez/vim-better-sml'
Plugin 'scrooloose/nerdcommenter'
Plugin 'itchyny/lightline.vim'
Plugin 'ajh17/vimcompletesme'
Plugin 'mk12/vim-lean'
Plugin 'lervag/vimtex'
Plugin 'sheerun/vim-polyglot'
Plugin 'vim-python/python-syntax'

Plugin 'chriskempson/base16-vim'
Plugin 'morhetz/gruvbox'
Plugin 'joshdick/onedark.vim'
Plugin 'rakr/vim-one'
Plugin 'drewtempelmeyer/palenight.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'


  set laststatus=2
  let g:airline_powerline_fonts = 0
  let g:airline_detect_paste=1
  let g:airline#extensions#tabline#enabled=1
  let g:airline_theme='onedark'


call vundle#end()
filetype plugin indent on

highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
set number

syntax on
filetype plugin indent on

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

" Syntax highlighting and stuff
syntax on
filetype plugin indent on

:imap jj <Esc>
noremap <silent> k gk
noremap <silent> j gj
noremap <silent> 0 g0
noremap <silent> $ g$
noremap <silent> ^ g^
noremap <silent> _ g_

"vnoremap <C-c> :w !pbcopy<CR><CR> noremap <C-v> :r !pbpaste<CR><CR>
" execute pathogen#infect()
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:lean_auto_replace = 1

xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

"" caps lock stuffs
"" Execute 'lnoremap x X' and 'lnoremap X x' for each letter a-z.
"for c in range(char2nr('A'), char2nr('Z'))
  "execute 'lnoremap ' . nr2char(c+32) . ' ' . nr2char(c)
  "execute 'lnoremap ' . nr2char(c) . ' ' . nr2char(c+32)
"endfor

"" Kill the capslock when leaving insert mode.
"autocmd InsertLeave * set iminsert=0
"
" mouse stuffs
"let &t_SI = "\e[6 q"
"let &t_EI = "\e[2 q"

"" optional reset cursor on start:
"augroup myCmds
"au!

"augroup END
"autocmd InsertEnter,InsertLeave * set cul!
set cul!

if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
    let &t_SR = "\<Esc>]50;CursorShape=3\x7" " Stay in block while replacing
    let &t_ER = "\<Esc>]50;CursorShape=0\x7" "
endif

function! ExecuteMacroOverVisualRange()
    echo "@".getcmdline()
      execute ":'<,'>normal @".nr2char(getchar())
endfunction

"colorscheme onedark
set background=dark
colorscheme onedark
let g:palenight_terminal_italics=1
if (has("termguicolors"))
  set termguicolors
endif

set cursorline

":let mapleader = ","
":map <Leader>A another line <Esc>

augroup mySyntastic
    " tell syntastic to always stick any detected errors into the
    " location-list
       au FileType sml let g:syntastic_always_populate_loc_list = 1
    "
    "     " automatically open and/or close the location-list
           au FileType sml let g:syntastic_auto_loc_list = 1
           augroup END
    "
    "       " press <Leader>S (i.e., \S) to not automatically check for errors
           nnoremap <Leader>S :SyntasticToggleMode<CR>
    "



