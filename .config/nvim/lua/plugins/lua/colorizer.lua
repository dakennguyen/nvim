return {
  "norcalli/nvim-colorizer.lua",
  cmd = "ColorizerToggle",
  init = function()
    vim.opt.termguicolors = true
  end,
  opts = {
    "*",
    "!fugitive",
    "!git",
  },
}
