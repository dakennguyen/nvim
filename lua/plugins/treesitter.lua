vim.pack.add {
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
  "https://github.com/Wansmer/treesj",
  "https://github.com/windwp/nvim-ts-autotag",
  "https://github.com/mistweaverco/kulala.nvim",
}

require("nvim-treesitter.configs").setup {
  auto_install = true,
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
    disable = { "ruby", "go" },
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<cr>",
      node_incremental = "<cr>",
      scope_incremental = false,
      node_decremental = "<bs>",
    },
  },
  -- nvim-treesitter-textobjects
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["am"] = "@function.outer",
        ["im"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
    swap = {
      enable = false,
      swap_next = {
        ["<leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner",
      },
    },
    lsp_interop = {
      enable = false,
      border = "single",
      peek_definition_code = {
        ["<leader>df"] = "@function.outer",
        ["<leader>dF"] = "@class.outer",
      },
    },
  },
}

vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- ##########################
-- treesj
-- ##########################
require("treesj").setup {
  use_default_keymaps = false,
  max_join_length = 9999,
}
map("n", "<space><space>", "<cmd>TSJToggle<cr>")
map("n", "gS", "<cmd>TSJSplit<cr>")
map("n", "gJ", "<cmd>TSJJoin<cr>")

-- ##########################
-- autotag
-- ##########################
require("nvim-ts-autotag").setup()

-- ##########################
-- kulala
-- ##########################
map("n", "<space>ro", "<cmd>lua require('kulala').open()<cr>", { silent = true })
map("n", "<space>rl", "<cmd>lua require('kulala').replay()<cr>", { silent = true })

require("kulala").setup {
  global_keymaps = false,
  display_mode = "float",
  kulala_keymaps = {
    ["Show verbose"] = { "D", function() require("kulala.ui").show_verbose() end },
  },
}
