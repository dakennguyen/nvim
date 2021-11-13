local start_time = vim.fn.reltime()

require 'impatient'
require 'utils'
require 'settings'

require 'plugins'
require 'mappings'
require 'commands'
require 'theme'

require 'rails'

vim.g.dashboard_custom_footer = { vim.fn.printf('Loaded in %.0fms', vim.fn.reltimefloat(vim.fn.reltime(start_time))*1000) }
