return {
  "Wansmer/treesj",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  keys = {
    { "<space><space>", "<cmd>TSJToggle<cr>" },
    { "gS", "<cmd>TSJSplit<cr>" },
    { "gJ", "<cmd>TSJJoin<cr>" },
  },
  opts = {
    use_default_keymaps = false,
    max_join_length = 9999,
  },
}
