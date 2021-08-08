use 'tpope/vim-endwise'
use 'tpope/vim-vinegar'
use 'tpope/vim-abolish'

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

use 'ntpeters/vim-better-whitespace'
use { 'iamcco/markdown-preview.nvim', run = 'cd app & yarn install' }
use 'karb94/neoscroll.nvim'
use 'junegunn/gv.vim'
use 'arecarn/vim-clean-fold'
use 'arecarn/vim-fold-cycle'
use 'szw/vim-maximizer'
use 'benmills/vimux'
use 'akinsho/nvim-toggleterm.lua'

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

require('plugins/neoscroll')

-- ==========================================
-- use 'junegunn/gv.vim'
-- ==========================================
map('n', '<leader>gv', ':GV!<CR>', { silent = true })             -- GV
map('v', '<leader>gv', ':GV<CR>',  { silent = true })             -- GV in Visual mode

-- ==========================================
-- use 'arecarn/vim-clean-fold'
-- ==========================================
vim.opt.foldtext = [[clean_fold#fold_text('_')]]

-- ==========================================
-- use 'szw/vim-maximizer'
-- ==========================================
vim.g.maximizer_set_default_mapping = 0
map('n', 'Zz', ':MaximizerToggle<CR>', { silent = true })
map('v', 'Zz', '<ESC>:MaximizerToggle<CR>gv', { silent = true })

-- ==========================================
-- use 'benmills/vimux'
-- ==========================================
vim.g.VimuxOrientation = "h"
vim.g.VimuxHeight = "30"
map('n', '!', ':VimuxPromptCommand<CR>')

-- netrw
vim.cmd[[
  augroup netrw_mapping
    autocmd!
    autocmd filetype netrw call NetrwMapping()
  augroup END

  function! NetrwMapping()
    nnoremap ? :help netrw-quickmap<CR>
    nmap <buffer> <leader>0 <Plug>NetrwRefresh
    silent! unmap <buffer> <c-l>
  endfunction
]]
