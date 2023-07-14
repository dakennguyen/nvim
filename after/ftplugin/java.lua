local o = vim.opt_local

o.expandtab = false
o.softtabstop = 8
o.shiftwidth = 8

vim.b["dispatch"] = "javac -cp src % && java -cp src %"
