return {
  'phaazon/hop.nvim',
  keys = '<space><space>',
  config = function()
    require('hop').setup()
    -- map('n', 'f', ':HopChar1<CR>', { silent = true })
    map('n', '<space><space>', ':HopWord<CR>', { silent = true, noremap = true })
  end,
}
