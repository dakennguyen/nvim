local o = vim.opt_local

o.expandtab = false
o.softtabstop = 8
o.shiftwidth = 8

buf_map("n", "`<cr>", ':let @+=expand("%")<cr>:R !javac -cp src <c-r>+ && java -cp src <c-r>+<cr>')
