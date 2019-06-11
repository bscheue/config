set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'lervag/vimtex'
  nnoremap <Leader>b <Esc>:w<CR>:VimtexCompile<CR>:VimtexErrors<CR>
  let g:vimtex_view_method = 'skim'
  let g:tex_flavor = 'latex'
  autocmd FileType tex setlocal signcolumn=no

Plugin 'KeitaNakamura/tex-conceal.vim'
  autocmd FileType tex setlocal conceallevel=2
  let g:tex_conceal="abdgm"

if (version >= 801)
  Plugin 'w0rp/ale'
    let g:ale_open_list = 1
    let g:ale_lint_one_save = 1
    let g:ale_lint_on_text_changed = 0
    let g:ale_pattern_options = {
    \   '.*\.tex$': {'ale_enabled': 0},
    \}

  autocmd BufRead,BufNewFile *.sig set filetype=sml
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


Plugin 'bscheue/vim-better-sml'
  autocmd FileType sml setlocal conceallevel=2
  " shouldn't need this, but it looks like this needs to be set manually
  if exists('$TMUX')
    autocmd FileType sml let g:sml_repl_backend='vimux'
  endif
  let g:sml_auto_create_def_use='never'


Plugin 'jez/vim-superman'
  nnoremap K :!vman <cword><CR>


Plugin 'sheerun/vim-polyglot'
  " need this to allow vimtex to work
  let g:polyglot_disabled = ['latex']

Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
   command! Gwc Gwrite | Gcommit
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-commentary'
  " comment current line and add new copy
  nnoremap <Leader>c yypk:Commentary<CR>j

Plugin 'mbbill/undotree'
  nnoremap <Leader>u :UndotreeToggle<CR>

Plugin 'arcticicestudio/nord-vim'
  let g:nord_italic = 1
  let g:nord_italic_comments = 1
  let g:nord_cursor_line_number_background = 1

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
  imap <C-J> <Plug>snipMateNextOrTrigger
  smap <C-J> <Plug>snipMateNextOrTrigger

Plugin 'honza/vim-snippets'

Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
  let g:vim_markdown_strikethrough = 1
  let g:vim_markdown_math = 1
  let g:vim_markdown_new_list_item_indent = 2
  let g:vim_markdown_autowrite = 1
  let g:vim_markdown_edit_url_in = 'vsplit'
  autocmd FileType markdown setlocal conceallevel=2
  autocmd FileType markdown setlocal nofoldenable

Plugin 'bscheue/apprentice'

Plugin 'machakann/vim-swap'

Plugin 'benmills/vimux'
  let g:VimuxOrientation = "h"
  let g:VimuxHeight = "40"

Plugin 'kien/rainbow_parentheses.vim'
  nnoremap <Leader>r :RainbowParenthesesToggle<CR>

call vundle#end()

let g:netrw_liststyle=3

" colorscheme nord
colorscheme apprentice
  hi Function         ctermbg=NONE        ctermfg=darkcyan      cterm=NONE


