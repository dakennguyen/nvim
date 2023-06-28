return {
  "dakennguyen/gv.vim",
  keys = "<space>gg",
  cmd = "GV",
  config = function()
    map("n", "<leader>gv", ":GV!<CR>", { silent = true })
    map("v", "<leader>gv", ":GV<CR>", { silent = true })

    map("n", "<space>gg", ":GV -n 200<cr>", { silent = true })
  end,
}
