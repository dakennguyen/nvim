return {
  "https://tpope.io/vim/dadbod.git",
  cmd = "DB",
  keys = { "<space>dr", "<space>dd", "<space>dt" },
  config = function()
    map("", "<space>dr", ":DB g:redis")
    map("", "<space>dd", ":DB g:dbdev")
    map("", "<space>dt", ":DB g:dbtest")

    vim.g["redis"] = "redis:localhost:6379"
  end,
}
