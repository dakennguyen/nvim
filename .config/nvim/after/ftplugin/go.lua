vim.b["dispatch"] = "go run %"
-- luacheck: ignore 631
-- buf_map('n', '<f9>', ':let @+="break ".expand("%").":".line(".") | call VimuxSendText(@+) | call VimuxSendKeys("Enter")<cr>', { silent = true })
