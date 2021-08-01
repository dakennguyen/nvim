use 'tpope/vim-endwise'

use 'dsznajder/vscode-es7-javascript-react-snippets', { 'do': 'yarn install --frozen-lockfile && yarn compile' }

use {
  'meain/vim-printer',
  config = function()
    vim.g.vim_printer_items = {
      ruby = 'byebug',
    }
  end,
}

use { 'junegunn/fzf', run = function() vim.fn['fzf#install']() end }
use 'junegunn/fzf.vim'

use 'cocopon/iceberg.vim'
use 'dakennguyen/blue-moon'

-------------------

use 'tpope/vim-abolish'
use 'ntpeters/vim-better-whitespace'
use 'kevinhwang91/nvim-bqf'
use 'akinsho/nvim-toggleterm.lua'
use { 'iamcco/markdown-preview.nvim', run = 'cd app & yarn install' }
use 'karb94/neoscroll.nvim'
use 'junegunn/gv.vim'

-- ==========================================
-- use 'ntpeters/vim-better-whitespace'
-- ==========================================
vim.g.strip_whitespace_on_save = 1
vim.g.strip_whitespace_confirm = 0
vim.g.better_whitespace_enabled = 1
vim.g.strip_max_file_size = 0
vim.g.better_whitespace_filetypes_blacklist={ 'diff', 'gitcommit', 'unite', 'qf', 'help',
                                              'markdown', 'TelescopePrompt', 'dashboard' }

-- ==========================================
-- use 'iamcco/markdown-preview.nvim'
-- ==========================================
map('n', '<leader>fp', [[:MarkdownPreview<CR>]], { silent = true })

require('plugins/bqf')
require('plugins/neoscroll')
require('plugins/toggleterm')

-- ==========================================
-- use 'junegunn/gv.vim'
-- ==========================================
map('n', '<leader>gv', ':GV!<CR>', { silent = true })             -- GV
map('v', '<leader>gv', ':GV<CR>',  { silent = true })             -- GV in Visual mode
