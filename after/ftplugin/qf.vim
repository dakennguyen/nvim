function! s:open()
  lua require("bqf.qfwin.handler").open(false)
  wincmd p
endfunction

nnoremap <silent><buffer> p :call <sid>open()<CR>
