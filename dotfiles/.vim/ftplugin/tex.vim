setlocal conceallevel=2
let g:rainbow#pairs = [['(', ')'], ['{', '}'], ['[', ']']]

compiler latexmk

" don't automatically open qf list since log file is used instead
let g:qf_auto_open_quickfix = 0

function! RedrawScreen(channel)
    redraw!
endfunction

function! ForwardSearch()
  let current_line = line('.')
  let pdf_name = expand('%:t:r') . '.pdf'
  let command = ['/Applications/Skim.app/Contents/SharedSupport/displayline',
                   \ '-b', '-g', current_line, pdf_name]
  let job = job_start(command, {'close_cb': 'RedrawScreen'})
endfunction

" should switch to proper autocmd
if (expand('%') =~# '.*\.xtx')
  setlocal makeprg=latexmk\ -pdf\ -pv\ --xelatex\ %
endif

" jump sections
noremap <script> <buffer> <silent> ]]
        \ :call search('^\\section\\|^\\task', '')<CR>
noremap <script> <buffer> <silent> [[
        \ :call search('^\\section\\|^\\task', 'b')<CR>
xnoremap <script> <buffer> <silent> ]]
        \ :<c-u>call search('^\\section\\|^\\task', '')<CR>
xnoremap <script> <buffer> <silent> [[
        \ :<c-u>call search('^\\section\\|^\\task', 'b')<CR>

" jump to top and bottom of environment
noremap <script> <buffer> <silent> ]M
        \ ?begin<CR>:normal %<CR>
noremap <script> <buffer> <silent> [M
        \ ?begin<CR>:nohlsearch<CR>
" should add xnoremap

" jump to $ environments
noremap <script> <buffer> <silent> ]m
        \ /\$<CR>
noremap <script> <buffer> <silent> [m
        \ ?\$<CR>
xnoremap <script> <buffer> <silent> ]m
        \ /\$<CR>
xnoremap <script> <buffer> <silent> [m
        \ ?\$<CR>

" environment text objects
xnoremap <script> <buffer> <silent> ie
      \ :<c-u>call search('\\begin', 'b') <bar> normal vV%koj<CR>
onoremap <script> <buffer> <silent> ie
      \ :<c-u>call search('\\begin', 'b') <bar> normal vV%koj<CR>
xnoremap <script> <buffer> <silent> ae
      \ :<c-u>call search('\\begin', 'b') <bar> normal vV%<CR>
onoremap <script> <buffer> <silent> ae
      \ :<c-u>call search('\\begin', 'b') <bar> normal vV%<CR>

" change surrouning environment
function! s:ChangeSurroundingEnvironment()
  call inputsave()
  let name = input('')
  call inputrestore()
  execute '.,/end{' . expand('<cword>') . '/s/{' . expand('<cword>') . '}/{' . name . '}'
endfunction

" fold by section
set foldmethod=expr
function! GetTexFold(lnum)
  if getline(a:lnum)=~'^.\(section\|task\)'
    return '>1'
  endif
  return 1
endfunction
set foldexpr=GetTexFold(v:lnum)

nnoremap <buffer> <Leader>f :silent call ForwardSearch()<CR>
nnoremap <buffer> <Leader>e :cfile %:t:r.log <bar> copen<CR>
nnoremap <script> <buffer> <silent> cse
  \ ?\\begin{?e<CR>l:call <SID>ChangeSurroundingEnvironment()<CR>:nohlsearch<CR>2<c-o>

