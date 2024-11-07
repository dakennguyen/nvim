return {
  "Wansmer/treesj",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  keys = {
    { "]s", "<cmd>TSJSplit<cr>" },
    { "[s", "<cmd>TSJJoin<cr>" },
  },
  opts = {
    use_default_keymaps = false,
    max_join_length = 9999,
  },
}
