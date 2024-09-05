local start_time = vim.fn.reltime()

require "utils.globals"
require "config.lazy"

require "config.mappings"
require "config.commands"
require "themes"

require "config.rails"

print(vim.fn.printf("Loaded in %.0fms", vim.fn.reltimefloat(vim.fn.reltime(start_time)) * 1000))
