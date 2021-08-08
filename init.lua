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

  -- Group: TPope
  use 'tpope/vim-surround'
  use 'tpope/vim-projectionist'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'tpope/vim-commentary'
  use { 'tpope/vim-repeat', branch = 'no-feedkeys' }
  use { 'dakennguyen/vim-unimpaired', branch = 'minimal' }

  -- Group: Language support
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'
  use 'dense-analysis/ale'
  use 'ludovicchabant/vim-gutentags'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'andymass/vim-matchup'

  -- Group: Framework support
  use 'vim-test/vim-test'
  use 'galooshi/vim-import-js'

  -- Group: Text
  use 'windwp/nvim-autopairs'
  use 'alvan/vim-closetag'
  use 'AndrewRadev/splitjoin.vim'
  use 'junegunn/vim-easy-align'

  -- Group: Files manager
  use { 'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}} }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'justinmk/vim-dirvish'

  -- Group: Navigator
  use 'phaazon/hop.nvim'
  use 'numToStr/Navigator.nvim'

  -- Group: Visual
  use 'gcmt/taboo.vim'
  use { 'norcalli/nvim-colorizer.lua', config = "require'colorizer'.setup()" }

  -- Group: Git
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }

  -- Group: Miscellaneous
  use 'kevinhwang91/nvim-bqf'
  use 'glepnir/dashboard-nvim'
  use { 'xolox/vim-notes', requires = 'xolox/vim-misc' }
end)

require('settings')
require('mappings')
require('functions')

require('plugins/autopairs')
require('plugins/bqf')
require('plugins/compe')
require('plugins/dashboard')
require('plugins/feline')
require('plugins/gitsigns')
require('plugins/hop')
require('plugins/lspconfig')
require('plugins/navigator')
require('plugins/telescope')
require('plugins/treesitter')

require('plugins/vim-ale')
require('plugins/vim-closetag')
require('plugins/vim-dirvish')
require('plugins/vim-easy-align')
require('plugins/vim-fugitive')
require('plugins/vim-gutentags')
require('plugins/vim-import-js')
require('plugins/vim-matchup')
require('plugins/vim-notes')
require('plugins/vim-projectionist')
require('plugins/vim-splitjoin')
require('plugins/vim-taboo')
require('plugins/vim-test')

require('theme')
