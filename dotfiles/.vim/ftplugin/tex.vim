setlocal conceallevel=2
let g:rainbow#pairs = [['(', ')'], ['{', '}'], ['[', ']']]

compiler latexmk

function! RedrawScreen(channel)
    redraw!
endfunction

function! ForwardSearch()
  let current_line = line('.')
  let pdf_name = expand('%:r') . '.pdf'
  let forwardsearch = ['/Applications/Skim.app/Contents/SharedSupport/displayline',
                   \ '-g', current_line, pdf_name]
  let _job = job_start(forwardsearch, {'close_cb': 'RedrawScreen'})
endfunction

nnoremap <buffer> <silent> <space>f :call ForwardSearch()<CR>

" should switch to proper autocmd
if (expand('%') =~# '.*\.xtx')
  setlocal makeprg=latexmk\ -pdf\ -pv\ --xelatex\ %
endif

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
setlocal foldmethod=expr
function! GetTexFold(lnum)
  let line = getline(a:lnum)
  if a:lnum == 1
    return '>1'
  elseif line =~'^.\(section\|task\)'
    return '>1'
  elseif line =~'^.\(subsection\|part\)'
    return '>2'
  endif
  return "="
endfunction
setlocal foldexpr=GetTexFold(v:lnum)

nnoremap <buffer> <space>ef
  \ :cfile %:t:r.log <bar> cwindow<CR>

function! StartBackgroundBuild()
  if exists("b:_texbg")
    echom "latex continuous compilation for this buffer is already running"
  else
    let b:_texbg = job_start('latexmk -cd -pdf -pvc -quiet ' . expand('%'))
  endif
endfunction

function! KillBackgroundBuild()
  if exists("b:_texbg")
    call job_stop(b:_texbg)
    unlet b:_texbg
  else
    echom "no latex continuous compilation for this buffer is running"
  endif
endfunction

command! -buffer -bar LatexStartBackgroundBuild call StartBackgroundBuild()
command! -buffer -bar LatexKillBackgroundBuild call KillBackgroundBuild()
