o = vim.opt_local

o.expandtab = false
o.softtabstop = 8
o.shiftwidth= 8

buf_map('n', '`<cr>', ':let @+=expand("%")<cr>:R !javac -cp src <c-r>+ && java -cp src <c-r>+<cr>')
buf_map('n', '<leader>rr', ':R !javac <c-r>=expand("%")<cr> && java <c-r>=expand("%:t:r")<cr><cr>')
