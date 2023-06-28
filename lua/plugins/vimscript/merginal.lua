return {
  "idanarye/vim-merginal",
  dependencies = "fugitive",
  cmd = "Merginal",
  config = function()
    vim.g.merginal_remoteVisible = 0
    vim.g.merginal_logCommitCount = 100
    vim.g.merginal_windowSize = 80
  end,
}
