return {
  "tpope/vim-dispatch",
  event = "VeryLazy",
  keys = {
    { "<leader>C", ":Copen<cr>", silent = true },
    { "<space>C", ":Copen!<cr>", silent = true },
    { mode = "v", "`<space>", ":Dispatch<space>" },
    { mode = "v", "`<cr>", ":Dispatch<cr>" },
    { "t<c-n>", "mT:.Dispatch<cr>" },
    { "t<c-l>", ":Copen|Dispatch<cr>" },
    { "t<c-g>", "'T" },
  },
  config = function()
    vim.g["dispatch_no_tmux_start"] = true
    vim.g["dispatch_compilers"] = {
      ["python -m pytest"] = "pytest",
      ["poetry run"] = "",
      ["bundle exec spring"] = "",
      ["bundle exec"] = "",
    }
  end,
}
