setlocal conceallevel=2
let g:rainbow#pairs = [['(', ')'], ['{', '}'], ['[', ']']]

compiler latexmk

function! RedrawScreen(channel)
    redraw!
endfunction

function! ForwardSearch()
  let current_line = line('.')
  let pdf_name = expand('%:t:r') . '.pdf'
  let command = ['/Applications/Skim.app/Contents/SharedSupport/displayline',
                   \ '-b', '-g', current_line, pdf_name]
  let _job = job_start(command, {'close_cb': 'RedrawScreen'})
endfunction

nnoremap <buffer> <silent> <Leader>f :call ForwardSearch()<CR>

" should switch to proper autocmd
if (expand('%') =~# '.*\.xtx')
  setlocal makeprg=latexmk\ -pdf\ -pv\ --xelatex\ %
endif

" jump sections
noremap <buffer> <silent> ]]
        \ :call search('^\\section\\|^\\task', '')<CR>
noremap <buffer> <silent> [[
        \ :call search('^\\section\\|^\\task', 'b')<CR>
xnoremap <buffer> <silent> ]]
        \ :<c-u>call search('^\\section\\|^\\task', '')<CR>
xnoremap <buffer> <silent> [[
        \ :<c-u>call search('^\\section\\|^\\task', 'b')<CR>

" jump to top and bottom of environment
noremap <buffer> <silent> ]M
        \ ?begin<CR>:normal %<CR>
noremap <buffer> <silent> [M
        \ ?begin<CR>:nohlsearch<CR>
" should add xnoremap

" jump to $ environments
noremap <buffer> <silent> ]m
        \ /\$<CR>
noremap <buffer> <silent> [m
        \ ?\$<CR>
xnoremap <buffer> <silent> ]m
        \ /\$<CR>
xnoremap <buffer> <silent> [m
        \ ?\$<CR>

" environment text objects
xnoremap <buffer> <silent> ie
      \ :<c-u>call search('\\begin', 'b') <bar> normal vV%koj<CR>
onoremap <buffer> <silent> ie
      \ :<c-u>call search('\\begin', 'b') <bar> normal vV%koj<CR>
xnoremap <buffer> <silent> ae
      \ :<c-u>call search('\\begin', 'b') <bar> normal vV%<CR>
onoremap <buffer> <silent> ae
      \ :<c-u>call search('\\begin', 'b') <bar> normal vV%<CR>

" change surrouning environment
function! s:ChangeSurroundingEnvironment()
  call inputsave()
  let name = input('')
  call inputrestore()
  let addnewenv = '"_cf}{' . name . '}'
  execute 'normal ?\\begin{%f{' . addnewenv . 'f{' . addnewenv . ''
endfunction

nnoremap <buffer> <silent> cse
  \ :<c-u>silent call <SID>ChangeSurroundingEnvironment()<CR>

" fold by section
set foldmethod=expr
function! GetTexFold(lnum)
  if getline(a:lnum)=~'^.\(section\|task\)'
    return '>1'
  endif
  return 1
endfunction
set foldexpr=GetTexFold(v:lnum)

nnoremap <buffer> <Leader>ef
  \ :cfile %:t:r.log <bar> cwindow<CR>

nnoremap <buffer> <silent> <leader>bm
  \ :<c-u>if exists("b:_texbg") <bar>
  \ echom "latex continuous compilation for this buffer is already running" <bar>
  \ else <bar>
  \ let b:_texbg = job_start('latexmk -pdf -pvc -quiet ' . expand('%')) <bar>
  \ endif<CR>

nnoremap <buffer> <silent> <leader>bk
  \ :<c-u>if exists("b:_texbg") <bar>
  \ call job_stop(b:_texbg)<CR>
  \ else <bar>
  \ echom "no latex continuous compilation for this buffer is running" <bar>
  \ endif<CR>
