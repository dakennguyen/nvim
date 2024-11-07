return {
  "hrsh7th/vim-vsnip",
  event = "InsertEnter",
  keys = {
    { "<leader>v", "<Plug>(vsnip-select-text)", mode = "n", noremap = false },
    { "<leader>v", "<Plug>(vsnip-select-text)", mode = "x", noremap = false },
    {
      "<C-l>",
      [[vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']],
      mode = { "i", "s" },
      noremap = false,
      expr = true,
      replace_keycodes = false,
    },
    {
      "<tab>",
      [[vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>']],
      mode = { "i", "s" },
      noremap = false,
      expr = true,
      replace_keycodes = false,
    },
    {
      "<s-tab>",
      [[vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>']],
      mode = { "i", "s" },
      noremap = false,
      expr = true,
      replace_keycodes = false,
    },
  },
}
