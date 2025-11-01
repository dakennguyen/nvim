return {
  "Wansmer/treesj",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  keys = {
    { "]j", "<cmd>TSJSplit<cr>" },
    { "[j", "<cmd>TSJJoin<cr>" },
  },
  opts = {
    use_default_keymaps = false,
    max_join_length = 9999,
  },
}
