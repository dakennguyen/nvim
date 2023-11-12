local plugins = {
  -- Group: Theme
  "nvim-tree/nvim-web-devicons",
  require "plugins.lua.lualine",
  "folke/tokyonight.nvim",
  -- "rmehri01/onenord.nvim",
  -- { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  -- 'EdenEast/nightfox.nvim',
  -- 'Th3Whit3Wolf/one-nvim',
  -- 'NTBBloodbath/doom-one.nvim',

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

  -- Group: Editing support
  require "plugins.lua.autopairs",
  require "plugins.lua.autotag",
  require "plugins.lua.treesj",
  require "plugins.vimscript.easy-align",

  -- Group: Files manager
  require "plugins.vimscript.dirvish",
  require "plugins.vimscript.fzf",

  -- Group: Navigator
  require "plugins.lua.flash",

  -- Group: Git
  require "plugins.lua.gitsigns",
  require "plugins.vimscript.gv",

  -- Group: Miscellaneous
  require "plugins.lua.colorizer",
  require "plugins.lua.bqf",
  require "plugins.lua.rest",
}

local lazy_configs = {
  defaults = { lazy = true },
  ui = {
    icons = {
      ft = "",
      cmd = "⌘",
      lazy = "鈴 ",
      event = "",
      start = "",
      loaded = "",
      not_loaded = "",
    },
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "2html_plugin",
        "tohtml",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        -- "matchit",
        "tar",
        "tarPlugin",
        "rrhelper",
        "spellfile_plugin",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
        "tutor",
        "rplugin",
        "syntax",
        "synmenu",
        "optwin",
        -- "compiler",
        "bugreport",
        -- "ftplugin",
      },
    },
  },
}

map("n", "<space>ph", ":Lazy<cr>")
map("n", "<space>ps", ":Lazy sync<cr>")
map("n", "<space>pi", ":Lazy install<cr>")
map("n", "<space>pc", ":Lazy clean<cr>")

require("lazy").setup(plugins, lazy_configs)
