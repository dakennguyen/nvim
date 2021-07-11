use 'tpope/vim-endwise'

use 'dsznajder/vscode-es7-javascript-react-snippets', { 'do': 'yarn install --frozen-lockfile && yarn compile' }

use {
  'galooshi/vim-import-js',
  config = function()
    map('n', '<leader>ii', ':ImportJSWord<CR>')
    map('n', '<leader>if', ':ImportJSFix<CR>')
    map('n', '<leader>ig', ':ImportJSGoto<CR>')
  end,

}
use {
  'meain/vim-printer',
  config = function()
    vim.g.vim_printer_items = {
      ruby = 'byebug',
    }
  end,
}

use {
  'dense-analysis/ale',
  config = "require('plugins/ale')",
}

use {
  'windwp/nvim-ts-autotag',
  config = "require('plugins/autotag')",
}
