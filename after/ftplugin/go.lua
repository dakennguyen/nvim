local o = vim.opt_local

o.expandtab = false
o.softtabstop = 8
o.shiftwidth = 8

vim.b["dispatch"] = "go run %"
-- luacheck:ignore 631
-- buf_map('n', '<f9>', ':let @+="break ".expand("%").":".line(".") | call VimuxSendText(@+) | call VimuxSendKeys("Enter")<cr>', { silent = true })
buf_map("n", "<f9>", ":GoDebugBreakpoint<cr>")
