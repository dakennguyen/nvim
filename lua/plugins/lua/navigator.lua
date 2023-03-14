return {
  'numToStr/Navigator.nvim',
  keys = { "<C-h>", "<C-k>", "<C-l>", "<C-j>" },
  opts = {
    disable_on_zoom = true
  },
  config = function(_, opts)
    require('Navigator').setup(opts)

    map('n', "<C-h>", "<CMD>lua require('Navigator').left()<CR>",  { silent = true })
    map('n', "<C-k>", "<CMD>lua require('Navigator').up()<CR>",    { silent = true })
    map('n', "<C-l>", "<CMD>lua require('Navigator').right()<CR>", { silent = true })
    map('n', "<C-j>", "<CMD>lua require('Navigator').down()<CR>",  { silent = true })
  end,
}
