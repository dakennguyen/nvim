return {
  'ludovicchabant/vim-gutentags',
  lazy = false,
  config = function()
    --vim.g.gutentags_cache_dir = get(g:, 'gutentags_cache_dir', expand('~/.cache/tags'))
    vim.g.gutentags_ctags_exclude = { '*.min.js', '*.min.css', 'build', 'vendor', '.git', 'node_modules', '*.vim/bundle/*' }
  end,
}
