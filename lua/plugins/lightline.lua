vim.g.lightline = {
  colorscheme = 'iceberg',
  active = {
    left = {
      { 'short_mode' },
      { 'readonly', 'filename', 'modified' }
    },
    right = {
      { 'lineinfo' },
      { 'filetype' }
    }
  },
  inactive = {
    left = {
      { 'readonly', 'filename', 'modified' }
    },
    right = {
      { 'lineinfo' }
    }
  },
  component = {
  short_mode = '%{toupper(mode())}',
  },
}
