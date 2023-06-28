local plugins = {
  -- Group: Theme
  { "kyazdani42/nvim-web-devicons", config = true },
  require "plugins.lua.lualine",
  "rmehri01/onenord.nvim",
  -- 'EdenEast/nightfox.nvim',
  -- 'shaunsingh/nord.nvim',
  -- 'Th3Whit3Wolf/one-nvim',
  -- 'romgrk/github-light.vim',
  -- 'NTBBloodbath/doom-one.nvim',

  -- Group: TPope
  require "plugins.tpope.misc",
  require "plugins.tpope.dadbod",
  require "plugins.tpope.fugitive",
  require "plugins.tpope.projectionist",

  -- Group: Language support
  require "plugins.lua.treesitter",
  { "nvim-treesitter/nvim-treesitter-textobjects", init = _G.lazy_load "nvim-treesitter-textobjects" },
  require "plugins.lua.lspconfig",
  require "plugins.vimscript.gutentags",
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  },
  require "plugins.vimscript.matchup",

  -- Group: Completion
  require "plugins.lua.cmp",
  require "plugins.vimscript.vsnip",
  require "plugins.vimscript.copilot",

  -- Group: Framework support
  require "plugins.vimscript.test",
  { "fatih/vim-go", ft = "go" },

  -- Group: Editing support
  require "plugins.lua.autopairs",
  require "plugins.lua.autotag",
  require "plugins.lua.treesj",
  require "plugins.vimscript.easy-align",

  -- Group: Files manager
  require "plugins.vimscript.fzf",

  -- Group: Navigator
  require "plugins.lua.flash",
  require "plugins.lua.navigator",

  -- Group: Git
  require "plugins.lua.gitsigns",
  require "plugins.vimscript.merginal",
  require "plugins.vimscript.gv",

  -- Group: Miscellaneous
  require "plugins.lua.colorizer",
  require "plugins.lua.bqf",
  {
    "NTBBloodbath/rest.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    ft = "http",
  },
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
        -- "netrw",
        -- "netrwPlugin",
        -- "netrwSettings",
        -- "netrwFileHandlers",
        "matchit",
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
        "compiler",
        "bugreport",
        "ftplugin",
      },
    },
  },
}

map("n", "<space>ps", ":Lazy sync<cr>")
map("n", "<space>pi", ":Lazy install<cr>")
map("n", "<space>pc", ":Lazy clean<cr>")

require("lazy").setup(plugins, lazy_configs)
