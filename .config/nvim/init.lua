local start_time = vim.fn.reltime()

require "globals"

require "config.options"
require "config.keymaps"
require "config.autocmds"
require "config.rails"

require "config.lazy"
require "plugins"

vim.notify(vim.fn.printf("Loaded in %.0fms", vim.fn.reltimefloat(vim.fn.reltime(start_time)) * 1000))
