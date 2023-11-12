vim.cmd [[
  " let &l:winheight = 12

  function! s:open()
  lua require("bqf.qfwin.handler").open(false)
  wincmd p
  endfunction

  nnoremap <silent><buffer> p :call <sid>open()<CR>
]]

buf_map("n", "<leader>z", ":tab split<cr>", { silent = true })
