local start_time = vim.fn.reltime()

require 'impatient'
require 'utils'
require 'settings'

require 'plugins'
require 'mappings'
require 'commands'
require 'theme'

require 'rails'

print('Loaded in ' .. vim.fn.printf('%.3f', vim.fn.reltimefloat(vim.fn.reltime(start_time))) .. ' seconds.')
