local start_time = vim.fn.reltime()

if require('utils.first_load')() then
  return
end

local plugins = require('plugins')

pcall(require, 'impatient')
require 'config.globals'
require 'config.settings'
require 'config.mappings'
require 'config.commands'
require 'config.theme'

require 'config.rails'

plugins.import()

print(
  vim.fn.printf(
    'Loaded in %.0fms',
    vim.fn.reltimefloat(vim.fn.reltime(start_time)) * 1000
  )
)
