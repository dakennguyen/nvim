return {
  "jpalardy/vim-slime",
  init = function()
    _G.lazy_load "vim-slime"
    vim.g.slime_target = "neovim"
  end,
}
