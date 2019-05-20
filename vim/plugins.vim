set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin
Plugin 'lervag/vimtex'
  nnoremap <Leader>b <Esc>:w<CR>:VimtexCompile<CR>:VimtexErrors<CR>
  let g:vimtex_view_method = 'zathura'
  let g:tex_flavor = 'latex'
  au FileType tex setlocal signcolumn=no

Plugin 'KeitaNakamura/tex-conceal.vim'
  au FileType tex setlocal conceallevel=2
  let g:tex_conceal="abdgm"

if (version >= 801)
  Plugin 'w0rp/ale'
  let g:ale_open_list = 1
  let g:ale_lint_one_save = 1
  let g:ale_lint_on_text_changed = 0
  let g:ale_pattern_options = {
  \   '.*\.tex$': {'ale_enabled': 0},
  \}

  au BufRead,BufNewFile *.sig set filetype=sml
else
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
endif


Plugin 'brians1123/vim-better-sml'
  au FileType sml setlocal conceallevel=2
  let g:sml_auto_create_def_use='always'

Plugin 'jez/vim-superman'
  nnoremap K :!vman <cword><CR>


Plugin 'sheerun/vim-polyglot'
  " need this to allow vimtex to work
  let g:polyglot_disabled = ['latex']

Plugin 'vim-python/python-syntax'

Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
   command! Gwc Gwrite | Gcommit
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-commentary'
  let @c = 'yypkgccj' " comment current line and add new copy

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

Plugin 'justinmk/vim-sneak'

call vundle#end()

let g:netrw_liststyle=3

set laststatus=2
let g:airline_powerline_fonts = 0
let g:airline_detect_paste=1
let g:airline_extensions = ['vimtex']
let g:airline_theme='nord'

colorscheme nord

