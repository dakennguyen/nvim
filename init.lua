local start_time = vim.fn.reltime()

function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- Group: Theme
  use { 'kyazdani42/nvim-web-devicons', config = "require'nvim-web-devicons'.setup {}" }
  use 'shadmansaleh/lualine.nvim'
  use 'shaunsingh/nord.nvim'

  -- Group: TPope
  use 'https://tpope.io/vim/surround.git'
  use 'https://tpope.io/vim/projectionist.git'
  use 'https://tpope.io/vim/fugitive.git'
  use 'https://tpope.io/vim/rhubarb.git'
  use 'https://tpope.io/vim/commentary.git'
  use 'https://tpope.io/vim/vinegar.git'
  use 'https://tpope.io/vim/bundler.git'
  use { 'https://tpope.io/vim/repeat.git', branch = 'no-feedkeys' }
  use { 'dakennguyen/vim-unimpaired', branch = 'minimal' }

  -- Group: Language support
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'
  use 'ludovicchabant/vim-gutentags'
  use {
    'JoosepAlviste/nvim-ts-context-commentstring',
    ft = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' }
  }
  use 'andymass/vim-matchup'

  -- Group: Framework support
  use 'vim-test/vim-test'

  -- Group: Text
  use 'windwp/nvim-autopairs'
  use {
    'windwp/nvim-ts-autotag',
    ft = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' }
  }
  use 'AndrewRadev/splitjoin.vim'
  use 'junegunn/vim-easy-align'

  -- Group: Files manager
  use { 'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}} }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Group: Navigator
  use 'phaazon/hop.nvim'
  use 'numToStr/Navigator.nvim'

  -- Group: Visual
  use 'gcmt/taboo.vim'
  use 'norcalli/nvim-colorizer.lua'

  -- Group: Git
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use 'idanarye/vim-merginal'
  use 'junegunn/gv.vim'

  -- Group: Miscellaneous
  use 'kevinhwang91/nvim-bqf'
  use 'glepnir/dashboard-nvim'
  use { 'szw/vim-maximizer', config = "vim.g.maximizer_default_mapping_key = '<leader>z'" }
  use 'diepm/vim-rest-console'
  use 'ntpeters/vim-better-whitespace'
end)

map('n', '<space>ps', ':PackerSync<cr>')
map('n', '<space>pi', ':PackerInstall<cr>')
map('n', '<space>pc', ':PackerClean<cr>')

require('settings')
require('mappings')
require('commands')
require('theme')

require('plugins/autopairs')
require('plugins/bqf')
require('plugins/colorizer')
require('plugins/compe')
require('plugins/dashboard')
require('plugins/gitsigns')
require('plugins/hop')
require('plugins/lspconfig')
require('plugins/lualine')
require('plugins/navigator')
require('plugins/telescope')
require('plugins/treesitter')

require('plugins/vim-better-whitespace')
require('plugins/vim-easy-align')
require('plugins/vim-fugitive')
require('plugins/vim-gutentags')
require('plugins/vim-gv')
require('plugins/vim-matchup')
require('plugins/vim-merginal')
require('plugins/vim-projectionist')
require('plugins/vim-rest-console')
require('plugins/vim-splitjoin')
require('plugins/vim-taboo')
require('plugins/vim-test')

print('Loaded in ' .. vim.fn.printf('%.3f', vim.fn.reltimefloat(vim.fn.reltime(start_time))) .. ' seconds.')
