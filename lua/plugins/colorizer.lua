vim.pack.add { "https://github.com/norcalli/nvim-colorizer.lua" }

vim.opt.termguicolors = true

require("colorizer").setup {
  "*",
  "!fugitive",
  "!git",
}
