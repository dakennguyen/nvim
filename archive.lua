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

use { 'iamcco/markdown-preview.nvim', run = 'cd app & yarn install' }
use 'benmills/vimux'
use 'galooshi/vim-import-js'
use { 'xolox/vim-notes', requires = 'xolox/vim-misc' }

-- ==========================================
-- use 'iamcco/markdown-preview.nvim'
-- ==========================================
map('n', '<leader>fp', [[:MarkdownPreview<CR>]], { silent = true })

-- ==========================================
-- use 'benmills/vimux'
-- ==========================================
vim.g.VimuxOrientation = "h"
vim.g.VimuxHeight = "30"
map('n', '!', ':VimuxPromptCommand<CR>')

-- autocmd ColorScheme * hi ALEWarning guifg=#EBCB8B
-- autocmd ColorScheme * hi ALEError guifg=#BF616A
-- autocmd ColorScheme * hi ALEWarningSign guifg=#EBCB8B
-- autocmd ColorScheme * hi ALEErrorSign guifg=#BF616A

-- autocmd ColorScheme * hi CocWarningHighlight guifg=#EBCB8B
-- autocmd ColorScheme * hi CocErrorHighlight guifg=#BF616A
-- autocmd ColorScheme * hi CocWarningSign guifg=#EBCB8B
-- autocmd ColorScheme * hi CocErrorSign guifg=#BF616A
-- autocmd ColorScheme * hi CocInfoSign guifg=#88C0D0
-- autocmd ColorScheme * hi CocHintSign guifg=#5E81AC
