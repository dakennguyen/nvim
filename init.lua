-- Install packer
-- git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

local start_time = vim.fn.reltime()
local plugins = require('plugins')

require 'impatient'
require 'utils'
require 'settings'
require 'mappings'
require 'commands'
require 'theme_onenord'

require 'rails'

plugins.import()

vim.g.dashboard_custom_footer = { vim.fn.printf('Loaded in %.0fms', vim.fn.reltimefloat(vim.fn.reltime(start_time))*1000) }
