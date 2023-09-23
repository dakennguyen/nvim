return {
  "dakennguyen/gv.vim",
  keys = { "<space>gg", "<leader>gv", { "<leader>gv", mode = "v" } },
  cmd = "GV",
  config = function()
    map("n", "<leader>gv", ":GV!<CR>", { silent = true })
    map("v", "<leader>gv", ":GV<CR>", { silent = true })

    map("n", "<space>gg", ":GV -n 200<cr>", { silent = true })
  end,
}
