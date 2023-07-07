return {
  "junegunn/vim-easy-align",
  keys = { "ga", { "ga", mode = "x" } },
  config = function()
    map("n", "ga", "<Plug>(EasyAlign)", { remap = true })
    map("x", "ga", "<Plug>(EasyAlign)", { remap = true })
  end,
}
