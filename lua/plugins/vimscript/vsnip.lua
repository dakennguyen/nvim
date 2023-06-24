return {
  'hrsh7th/vim-vsnip',
  event = 'InsertEnter',
  config = function()
    map('n', '<leader>v', '<Plug>(vsnip-select-text)', { noremap = false })
    map('x', '<leader>v', '<Plug>(vsnip-select-text)', { noremap = false })
  end,
}
