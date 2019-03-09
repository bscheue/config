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
Plugin 'tpope/vim-surround'

Plugin 'chriskempson/base16-vim'
Plugin 'morhetz/gruvbox'
Plugin 'joshdick/onedark.vim'
Plugin 'rakr/vim-one'
Plugin 'drewtempelmeyer/palenight.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()

"colorscheme onedark
au FileType sml setlocal conceallevel=2

set laststatus=2
let g:airline_powerline_fonts = 0
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='onedark'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:lean_auto_replace = 1

"colorscheme onedark
set background=dark
colorscheme onedark
let g:palenight_terminal_italics=1
if (has("termguicolors"))
  set termguicolors
endif

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
