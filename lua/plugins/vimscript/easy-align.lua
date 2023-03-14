return {
  'junegunn/vim-easy-align',
  keys = { 'ga', { 'ga', mode = 'x' } },
  config = function()
    map('n', 'ga', '<Plug>(EasyAlign)', { noremap = false })
    map('x', 'ga', '<Plug>(EasyAlign)', { noremap = false })
  end,
}
