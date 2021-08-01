function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- Group: Theme
  use { 'kyazdani42/nvim-web-devicons', config = "require'nvim-web-devicons'.setup {}" }
  use 'famiu/feline.nvim'
  use 'shaunsingh/nord.nvim'

  -- Group: Development
  use 'tpope/vim-surround'
  use 'b3nj5m1n/kommentary'
  use 'tpope/vim-abolish'
  use 'ntpeters/vim-better-whitespace'
  use 'ludovicchabant/vim-gutentags'
  use 'AndrewRadev/splitjoin.vim'
  use 'vim-test/vim-test'
  use 'windwp/nvim-autopairs'
  use 'kevinhwang91/nvim-bqf'
  use 'junegunn/vim-easy-align'
  -- FE stuffs
  use 'dense-analysis/ale'
  use 'alvan/vim-closetag'
  use 'galooshi/vim-import-js'

  -- Group: Language support
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'

  -- Group: Navigator
  use { 'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}} }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'phaazon/hop.nvim'
  use 'tpope/vim-projectionist'
  use 'numToStr/Navigator.nvim'
  use 'tpope/vim-vinegar'

  -- Group: Visual
  use 'arecarn/vim-clean-fold'
  use 'szw/vim-maximizer'
  use 'arecarn/vim-fold-cycle'
  use 'gcmt/taboo.vim'
  use { 'norcalli/nvim-colorizer.lua', config = "require'colorizer'.setup()" }

  -- Group: Git
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'junegunn/gv.vim'
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }

  -- Group: Miscellaneous
  use 'glepnir/dashboard-nvim'
  use 'tpope/vim-unimpaired'
  use { 'tpope/vim-repeat', branch = 'no-feedkeys' }
  use 'benmills/vimux'
  use { 'xolox/vim-notes', requires = 'xolox/vim-misc' }
  use 'akinsho/nvim-toggleterm.lua'
  use { 'iamcco/markdown-preview.nvim', run = 'cd app & yarn install' }
  use 'karb94/neoscroll.nvim'
end)

require('settings')
require('mappings')
require('functions')




-- #############################################
-- Section: Plugins
-- #############################################

-- ==========================================
-- use 'junegunn/vim-easy-align'
-- ==========================================
map('n', 'ga', '<Plug>(EasyAlign)', { noremap = false })
map('x', 'ga', '<Plug>(EasyAlign)', { noremap = false })

-- ==========================================
-- use 'xolox/vim-notes'
-- ==========================================
vim.g.notes_directories = { '~/Documents/Workspace/Thinkei/Notes' }
vim.g.notes_tab_indents = 0
map('n', '<space>gn', ':80vs note:home<cr>:MostRecentNote<cr><cr>', { silent = true })

-- ==========================================
-- use 'gcmt/taboo.vim'
-- ==========================================
vim.opt.sessionoptions:append { 'tabpages', 'globals' }
vim.g.taboo_tab_format = ' %N-%f%m '
vim.g.taboo_renamed_tab_format = ' %N-[%l]%m '
map('n', '<leader>rn', ':TabooRename ')

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
-- use 'AndrewRadev/splitjoin.vim'
-- ==========================================
vim.g.splitjoin_split_mapping = ']s'
vim.g.splitjoin_join_mapping  = '[s'

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
-- use 'ludovicchabant/vim-gutentags'
-- ==========================================
--vim.g.gutentags_cache_dir = get(g:, 'gutentags_cache_dir', expand('~/.cache/tags'))
vim.g.gutentags_ctags_exclude = { '*.min.js', '*.min.css', 'build', 'vendor', '.git', 'node_modules', '*.vim/bundle/*' }

-- ==========================================
-- use 'benmills/vimux'
-- ==========================================
vim.g.VimuxOrientation = "h"
vim.g.VimuxHeight = "30"

-- ==========================================
-- use 'vim-test/vim-test'
-- ==========================================
vim.g["test#strategy"] = "vimux"
vim.g['test#preserve_screen'] = 1

vim.g['test#ruby#bundle_exec'] = 1
vim.g['test#ruby#use_binstubs'] = 0
vim.g['test#javascript#runner'] = 'jest'
vim.g['test#javascript#jest#executable'] = 'yarn test'

map('n', 't<C-n>', ':TestNearest<CR>', { noremap = false, silent = true })
map('n', 't<C-f>', ':TestFile<CR>',    { noremap = false, silent = true })
map('n', 't<C-s>', ':TestSuite<CR>',   { noremap = false, silent = true })
map('n', 't<C-l>', ':TestLast<CR>',    { noremap = false, silent = true })
map('n', 't<C-g>', ':TestVisit<CR>',   { noremap = false, silent = true })

-- ==========================================
-- use 'tpope/vim-fugitive'
-- ==========================================
vim.opt.diffopt:append { 'vertical' }
map('n', 'gb', ':Git blame<CR>',               { silent = true }) -- Git Blame
map('n', '<leader>gg', ':G<CR>',               { silent = true }) -- Git
map('n', '<leader>gd', ':Gdiffsplit<CR>',      { silent = true }) -- Git diff
map('n', '<leader>gs', ':Glog -g stash<CR>',   { silent = true }) -- Git stash
map('n', '<leader>gt', ':0Gclog<CR>',          { silent = true }) -- Git time machine
map('n', '<leader>gl', ':GBrowse<CR>',         { silent = true }) -- Git Browse
map('v', '<leader>gl', [[:'<,'>.GBrowse<CR>]], { silent = true }) -- Git Browse in Visual mode

-- ==========================================
-- use 'junegunn/gv.vim'
-- ==========================================
map('n', '<leader>gv', ':GV!<CR>', { silent = true })             -- GV
map('v', '<leader>gv', ':GV<CR>',  { silent = true })             -- GV in Visual mode

-- ==========================================
-- use 'iamcco/markdown-preview.nvim'
-- ==========================================
map('n', '<leader>fp', [[:MarkdownPreview<CR>]], { silent = true })

-- ==========================================
-- use 'galooshi/vim-import-js'
-- ==========================================
map('n', '<leader>ii', ':ImportJSWord<CR>')
map('n', '<leader>if', ':ImportJSFix<CR>')
map('n', '<leader>ig', ':ImportJSGoto<CR>')

-- ==========================================
-- use 'alvan/vim-closetag'
-- ==========================================
vim.g.closetag_filenames = '*.html,*.jsx,*.tsx,*.js,*.erb'

-- #############################################
-- #############################################

require('plugins/autopairs')
require('plugins/bqf')
require('plugins/compe')
require('plugins/dashboard')
require('plugins/hop')
require('plugins/kommentary')
require('plugins/lspconfig')
require('plugins/navigator')
require('plugins/neoscroll')
require('plugins/feline')
require('plugins/gitsigns')
require('plugins/telescope')
require('plugins/toggleterm')
require('plugins/treesitter')

require('plugins/vim-ale')
require('plugins/vim-projectionist')

require('theme')
