return {
  -- Group: Theme
  "nvim-tree/nvim-web-devicons",
  require "plugins.lua.lualine",
  "folke/tokyonight.nvim",
  -- "rmehri01/onenord.nvim",
  -- { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  -- "shaunsingh/nord.nvim",
  -- "EdenEast/nightfox.nvim",
  -- "Th3Whit3Wolf/one-nvim",
  -- "NTBBloodbath/doom-one.nvim",

  -- Group: TPope
  require "plugins.tpope.misc",
  require "plugins.tpope.dadbod",
  require "plugins.tpope.dispatch",
  require "plugins.tpope.fugitive",
  require "plugins.tpope.projectionist",

  -- Group: Language support
  require "plugins.lua.treesitter",
  { "nvim-treesitter/nvim-treesitter-textobjects", init = _G.lazy_load "nvim-treesitter-textobjects" },
  require "plugins.lua.lspconfig",
  require "plugins.vimscript.gutentags",
  require "plugins.lua.context-commentstring",

  -- Group: Completion
  require "plugins.lua.cmp",
  require "plugins.vimscript.vsnip",
  require "plugins.vimscript.copilot",

  -- Group: Framework support
  require "plugins.vimscript.test",
  require "plugins.lua.dap",

  -- Group: Editing support
  require "plugins.lua.autopairs",
  require "plugins.lua.autotag",
  require "plugins.lua.treesj",

  -- Group: Files manager
  require "plugins.lua.oil",
  require "plugins.lua.fzf",

  -- Group: Navigator
  require "plugins.lua.flash",
  require "plugins.lua.marks",

  -- Group: Git
  require "plugins.lua.gitsigns",

  -- Group: Miscellaneous
  require "plugins.lua.colorizer",
  require "plugins.lua.bqf",
  require "plugins.lua.rest",
}
