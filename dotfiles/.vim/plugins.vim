set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'lervag/vimtex'
  let g:vimtex_view_method = 'skim'
  let g:tex_flavor = 'latex'

Plugin 'KeitaNakamura/tex-conceal.vim'
  let g:tex_conceal="abdgm"

Plugin 'jez/vim-superman'
  nnoremap K :!vman <cword><CR>

Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
   command! Gwc Gwrite | Gcommit
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-speeddating'
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

Plugin 'bscheue/apprentice'

Plugin 'machakann/vim-swap'
  omap i, <Plug>(swap-textobject-i)
  xmap i, <Plug>(swap-textobject-i)
  omap a, <Plug>(swap-textobject-a)
  xmap a, <Plug>(swap-textobject-a)

Plugin 'junegunn/rainbow_parentheses.vim'
  nnoremap <Leader>r :RainbowParentheses!!<CR>

Plugin 'romainl/vim-qf'

Plugin 'christoomey/vim-tmux-navigator'

Plugin 'markonm/traces.vim'

Plugin 'tommcdo/vim-lion'

call vundle#end()

packadd! matchit

let g:netrw_liststyle=3

colorscheme apprentice

