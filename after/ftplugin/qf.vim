lua buf_map('n', '<leader>q', ':q<CR>', { silent = true })
function! s:open()
  lua require("bqf.qfwin.handler").open(false)
  wincmd p
endfunction

nnoremap <silent><buffer> p :call <sid>open()<CR>
