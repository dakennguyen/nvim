local start_time = vim.fn.reltime()

require "utils.first_load"
require "utils.globals"
require "config.settings"
require "plugins"

require "config.mappings"
require "config.commands"
require "config.theme"

require "config.rails"

print(
  vim.fn.printf(
    'Loaded in %.0fms',
    vim.fn.reltimefloat(vim.fn.reltime(start_time)) * 1000
  )
)
