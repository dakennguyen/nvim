local start_time = vim.fn.reltime()

require 'impatient'

function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

require 'settings'
require 'plugins'
require 'mappings'
require 'commands'
require 'theme'

print('Loaded in ' .. vim.fn.printf('%.3f', vim.fn.reltimefloat(vim.fn.reltime(start_time))) .. ' seconds.')
