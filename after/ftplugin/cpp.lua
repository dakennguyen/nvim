vim.o.commentstring = "// %s"

vim.o.makeprg = "g++ -g % -o %:r"
vim.b["dispatch"] = "./%:r"
