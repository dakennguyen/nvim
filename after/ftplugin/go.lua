o = vim.opt_local

o.expandtab = false
o.softtabstop = 8
o.shiftwidth= 8

buf_map('n', '<leader>rr', ':vsplit term://go run <c-r>=expand("%")<CR><CR>')
-- buf_map('n', '<f9>', ':let @+="break ".expand("%").":".line(".") | call VimuxSendText(@+) | call VimuxSendKeys("Enter")<cr>', { silent = true })
buf_map('n', '<f9>', ':GoDebugBreakpoint<cr>')
