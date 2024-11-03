return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "bash",
      "c",
      "cpp",
      "css",
      "dockerfile",
      "go",
      "haskell",
      "html",
      "http",
      "java",
      "javascript",
      "json",
      "lua",
      "luadoc",
      "markdown",
      "python",
      "r",
      "ruby",
      "scss",
      "sql",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "yaml",
    },
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
      disable = { "ruby", "go" },
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)

    vim.o.foldmethod = "expr"
    vim.o.foldexpr = "nvim_treesitter#foldexpr()"
    vim.o.foldlevel = 99
  end,
}
