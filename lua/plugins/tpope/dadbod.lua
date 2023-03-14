return {
  'https://tpope.io/vim/dadbod.git',
  cmd = 'DB',
  keys = { '<leader>dr', '<leader>dd', '<leader>dt' },
  config = function()
    map('', '<leader>dr', ':DB g:redis')
    map('', '<leader>dd', ':DB g:dbdev')
    map('', '<leader>dt', ':DB g:dbtest')

    vim.g['redis'] = "redis:localhost:6379"
  end,
}
