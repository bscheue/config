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


Plugin 'bscheue/vim-better-sml'
  let g:sml_auto_create_def_use='never'
  augroup SML
    autocmd!
    autocmd BufRead,BufNewFile *.sig setlocal filetype=sml
    autocmd FileType sml setlocal conceallevel=2
    autocmd FileType sml setlocal errorformat=%f\:%l.%c-%*[0-9].%*[0-9]\ %tRROR:\ %m
    autocmd FileType sml setlocal errorformat+=%f\:%l.%c-%*[0-9].%*[0-9]\ %tARNING:\ %m,%-G%.%#
    " shouldn't need this, but it looks like this needs to be set manually
    if exists('$TMUX')
      autocmd FileType sml let g:sml_repl_backend='vimux'
    endif
    autocmd FileType sml execute 'SMLSetCM'
  augroup END


Plugin 'jez/vim-superman'
  nnoremap K :!vman <cword><CR>

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

Plugin 'kana/vim-textobj-user'
Plugin 'glts/vim-textobj-comment'
Plugin 'sgur/vim-textobj-parameter'
Plugin 'Julian/vim-textobj-variable-segment'

Plugin 'romainl/vim-qf'

call vundle#end()

let g:netrw_liststyle=3

colorscheme apprentice

