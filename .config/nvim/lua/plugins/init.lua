return {
  -- Group: Theme
  require("themes").specs,
  require "plugins.lua.lualine",

  -- Group: TPope
  require "plugins.tpope.misc",
  require "plugins.tpope.dispatch",
  require "plugins.tpope.fugitive",
  require "plugins.tpope.projectionist",

  -- Group: Language support
  require "plugins.lua.treesitter",
  require "plugins.lua.lspconfig",
  require "plugins.vimscript.gutentags",

  -- Group: Completion
  require "plugins.lua.cmp",
  require "plugins.vimscript.vsnip",
  require "plugins.vimscript.copilot",

  -- Group: Framework support
  require "plugins.vimscript.test",
  require "plugins.lua.dap",

  -- Group: Editing support
  require "plugins.lua.autopairs",
  require "plugins.lua.treesj",
  require "plugins.lua.treesitter-textobjects",

  -- Group: Files manager
  require "plugins.lua.oil",

  -- Group: Navigator
  require "plugins.lua.flash",
  require "plugins.lua.harpoon",

  -- Group: Git
  require "plugins.lua.gitsigns",

  -- Group: Miscellaneous
  require "plugins.lua.rest",
  require "plugins.lua.snacks",
}
