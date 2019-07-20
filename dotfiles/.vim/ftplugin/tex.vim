setlocal conceallevel=2

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

nnoremap <Leader>f :silent call ForwardSearch()<CR>

