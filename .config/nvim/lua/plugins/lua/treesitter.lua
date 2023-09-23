return {
  "nvim-treesitter/nvim-treesitter",
  init = _G.lazy_load "nvim-treesitter",
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "ruby",
      "go",
      "dockerfile",
      "yaml",
      "lua",
      "bash",
      "json",
      "javascript",
      "tsx",
      "typescript",
      "scss",
      "css",
      "http",
      "markdown",
      "java",
      "python",
      "haskell",
      "c",
      "cpp",
      "html",
      "vim",
      "r",
    },
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
      disable = { "ruby", "go" },
    },
    matchup = {
      enable = true,
    },
    -- "JoosepAlviste/nvim-ts-context-commentstring"
    context_commentstring = {
      enable = true,
    },
    -- "nvim-treesitter/nvim-treesitter-textobjects"
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
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
