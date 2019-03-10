set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-syntastic/syntastic'
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 0
  let g:syntastic_check_on_wq = 0

  augroup mySyntastic
    au FileType sml let g:syntastic_always_populate_loc_list = 1
    au FileType sml let g:syntastic_auto_loc_list = 1
  augroup END

  nnoremap <Leader>S :SyntasticToggleMode<CR>

Plugin 'jez/vim-better-sml'
  au FileType sml setlocal conceallevel=2

Plugin 'jez/vim-superman'

Plugin 'scrooloose/nerdcommenter'
Plugin 'itchyny/lightline.vim'
Plugin 'ajh17/vimcompletesme'
Plugin 'mk12/vim-lean'
Plugin 'lervag/vimtex'
Plugin 'sheerun/vim-polyglot'
Plugin 'vim-python/python-syntax'
Plugin 'tpope/vim-surround'

"Plugin 'chriskempson/base16-vim'
Plugin 'morhetz/gruvbox'
Plugin 'joshdick/onedark.vim'
Plugin 'rakr/vim-one'
Plugin 'drewtempelmeyer/palenight.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'mbbill/undotree'
  nnoremap <Leader>u :UndotreeToggle<CR>

call vundle#end()

"colorscheme onedark

set laststatus=2
let g:airline_powerline_fonts = 0
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='onedark'


let g:lean_auto_replace = 1

"colorscheme onedark
set background=dark
colorscheme onedark
let g:palenight_terminal_italics=1
if (has("termguicolors"))
  set termguicolors
endif


