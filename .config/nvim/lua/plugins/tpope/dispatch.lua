return {
  "https://tpope.io/vim/dispatch.git",
  event = "VeryLazy",
  config = function()
    map("n", "<leader>C", ":Copen<cr>", { silent = true })
    map("n", "<space>C", ":Copen!<cr>", { silent = true })

    vim.g["dispatch_no_tmux_make"] = true
    vim.g["dispatch_no_tmux_start"] = true
    vim.g["dispatch_compilers"] = {
      ["python -m pytest"] = "pytest",
      ["poetry run"] = "",
      ["bundle exec spring"] = "",
      ["bundle exec"] = "",
    }
  end,
}
