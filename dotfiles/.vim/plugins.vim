set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
   command! Gwc Gwrite | Gcommit
Plugin 'tpope/vim-repeat'
Plugin 'bscheue/vim-unimpaired'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-commentary'
  " comment current line and add new copy
  nnoremap <Leader>c :t.<CR>k:Commentary<CR>j

Plugin 'mbbill/undotree'
  nnoremap <Leader>u :UndotreeToggle<CR>

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
  imap <C-J> <Plug>snipMateNextOrTrigger
  smap <C-J> <Plug>snipMateNextOrTrigger

Plugin 'bscheue/apprentice'

Plugin 'machakann/vim-swap'
  omap i, <Plug>(swap-textobject-i)
  xmap i, <Plug>(swap-textobject-i)
  omap a, <Plug>(swap-textobject-a)
  xmap a, <Plug>(swap-textobject-a)

Plugin 'junegunn/rainbow_parentheses.vim'
  nnoremap <Leader>r :RainbowParentheses!!<CR>

Plugin 'romainl/vim-qf'
  let g:qf_auto_resize = 0

Plugin 'christoomey/vim-tmux-navigator'

Plugin 'markonm/traces.vim'

Plugin 'tommcdo/vim-lion'

call vundle#end()

try
  packadd! matchit
catch
endtry

let g:netrw_liststyle=3

colorscheme apprentice

