return {
  "Wansmer/treesj",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  keys = { "]s", "[s" },
  opts = {
    use_default_keymaps = false,
    max_join_length = 9999,
  },
  config = function(_, opts)
    require("treesj").setup(opts)
    vim.keymap.set("n", "]s", require("treesj").split)
    vim.keymap.set("n", "[s", require("treesj").join)
  end,
}
