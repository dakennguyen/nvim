return {
  "tpope/vim-dadbod",
  cmd = "DB",
  keys = {
    { mode = "", "<space>dr", ":DB g:redis" },
    { mode = "", "<space>dd", ":DB g:dbdev" },
    { mode = "", "<space>dt", ":DB g:dbtest" },
  },
  config = function()
    vim.g["redis"] = "redis:localhost:6379"
  end,
}
