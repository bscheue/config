set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdcommenter'
  let @c = 'yypk\ccj' " comment current line and add new copy
Plugin 'lervag/vimtex'
  nnoremap <Leader>b <Esc>:w<CR>:VimtexCompileSS<CR>:VimtexErrors<CR>
  let g:vimtex_view_method = 'skim'

Plugin 'KeitaNakamura/tex-conceal.vim'
  au FileType tex setlocal conceallevel=2
  let g:tex_conceal="abdgm"

Plugin 'vim-syntastic/syntastic'

  let g:syntastic_ignore_files = [ "\m*..tex$" ]
  let g:syntastic_enable_balloons = 0
  let g:syntastic_latex_checkers = [ 'errors-only' ]

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 0
  let g:syntastic_check_on_wq = 0

  augroup mySyntastic
    au FileType sml let g:syntastic_always_populate_loc_list = 1
    au FileType sml let g:syntastic_auto_loc_list = 1
  augroup END

Plugin 'jez/vim-better-sml'
  au FileType sml setlocal conceallevel=2

Plugin 'jez/vim-superman'

"Plugin 'scrooloose/nerdtree'
  "" open nerdtree when no files are specified
  "autocmd StdinReadPre * let s:std_in=1
  "autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
  "" open nerdtree when vim started on a directory
  "autocmd StdinReadPre * let s:std_in=1
  "autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
  "nnoremap <Leader>t <Esc>:NERDTreeToggle<CR>
  "" close nerdtree if it's the only thing left
  "autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


Plugin 'ajh17/vimcompletesme'
Plugin 'mk12/vim-lean', { 'for': 'lean' }
  " not sure why i need this, but without it, vim doesn't
  " know to highlight .lean files
  au BufNewFile,BufRead *.lean setf lean
  let g:lean_auto_replace = 1
  nnoremap <Leader>s <Esc>:w<CR>:LeanCheck<CR>

Plugin 'sheerun/vim-polyglot'
  " need this to allow vimtex to work
  let g:polyglot_disabled = ['latex']

Plugin 'vim-python/python-syntax'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-vinegar'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'mbbill/undotree'
  nnoremap <Leader>u :UndotreeToggle<CR>

Plugin 'arcticicestudio/nord-vim'
  let g:nord_italic = 1
  let g:nord_italic_comments = 1
  let g:nord_cursor_line_number_background = 1

Plugin 'SirVer/ultisnips'

Plugin 'honza/vim-snippets'
  let g:UltiSnipsExpandTrigger="<c-t>"
  let g:UltiSnipsJumpForwardTrigger="<c-b>"
  let g:UltiSnipsJumpBackwardTrigger="<c-z>"
  let g:UltiSnipsEditSplit="vertical"

call vundle#end()

set laststatus=2
let g:airline_powerline_fonts = 0
let g:airline_detect_paste=1
let g:airline_extensions = ['vimtex']
let g:airline_theme='nord'


"if (has("termguicolors"))
  "set termguicolors
"endif

colorscheme nord
