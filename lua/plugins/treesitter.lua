require'nvim-treesitter.configs'.setup {
  ensure_installed = { 'ruby', 'dockerfile', 'yaml', 'lua', 'bash', 'json', 'javascript', 'typescript',
                       'scss', 'css' },
  highlight = {
    enable = true,
  },
  incremental_selection = {
    enable = false,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  indent = {
    enable = false
  },
  matchup = {
    enable = true,
  },
}
