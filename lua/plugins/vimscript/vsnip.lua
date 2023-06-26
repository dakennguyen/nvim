return {
  'hrsh7th/vim-vsnip',
  event = 'InsertEnter',
  keys = '<leader>v',
  config = function()
    map('n', '<leader>v', '<Plug>(vsnip-select-text)', { noremap = false })
    map('x', '<leader>v', '<Plug>(vsnip-select-text)', { noremap = false })
    map('i', '<C-l>', [[vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']], { noremap = false, expr = true })
    map('s', '<C-l>', [[vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']], { noremap = false, expr = true })
    map('i', '<tab>', [[vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>']], { noremap = false, expr = true })
    map('s', '<tab>', [[vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>']], { noremap = false, expr = true })
    map('i', '<s-tab>', [[vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>']], { noremap = false, expr = true })
    map('s', '<s-tab>', [[vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>']], { noremap = false, expr = true })
  end,
}
