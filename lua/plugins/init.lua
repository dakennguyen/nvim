require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- Group: Theme
  use { 'kyazdani42/nvim-web-devicons', config = "require'nvim-web-devicons'.setup {}" }
  use 'nvim-lualine/lualine.nvim'
  use 'rmehri01/onenord.nvim'
  -- use 'EdenEast/nightfox.nvim'
  -- use 'shaunsingh/nord.nvim'
  -- use 'Th3Whit3Wolf/one-nvim'
  -- use 'romgrk/github-light.vim'
  -- use 'NTBBloodbath/doom-one.nvim'

  -- Group: TPope
  use { 'https://tpope.io/vim/dadbod.git', cmd = 'DB' }
  use 'https://tpope.io/vim/surround.git'
  use 'https://tpope.io/vim/projectionist.git'
  use 'https://tpope.io/vim/fugitive.git'
  use 'https://tpope.io/vim/rhubarb.git'
  use 'https://tpope.io/vim/commentary.git'
  use 'https://tpope.io/vim/vinegar.git'
  use 'https://tpope.io/vim/bundler.git'
  use { 'https://tpope.io/vim/repeat.git', branch = 'no-feedkeys' }
  use 'dakennguyen/vim-unimpaired'

  -- Group: Language support
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'neovim/nvim-lspconfig'
  use 'ludovicchabant/vim-gutentags'
  use {
    'JoosepAlviste/nvim-ts-context-commentstring',
    ft = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' }
  }
  use 'andymass/vim-matchup'

  -- Group: Completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  -- Group: Framework support
  use 'vim-test/vim-test'
  use { 'fatih/vim-go', ft = 'go' }

  -- Group: Editing support
  use 'windwp/nvim-autopairs'
  use {
    'windwp/nvim-ts-autotag',
    ft = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' }
  }
  use 'AndrewRadev/splitjoin.vim'
  use 'junegunn/vim-easy-align'

  -- Group: Files manager
  use { 'junegunn/fzf', run = function() vim.fn['fzf#install']() end }
  use 'junegunn/fzf.vim'

  -- Group: Navigator
  use 'phaazon/hop.nvim'
  use 'numToStr/Navigator.nvim'

  -- Group: Git
  use { 'lewis6991/gitsigns.nvim', requires = 'nvim-lua/plenary.nvim' }
  use 'idanarye/vim-merginal'
  use 'dakennguyen/gv.vim'

  -- Group: Miscellaneous
  use 'norcalli/nvim-colorizer.lua'
  use 'kevinhwang91/nvim-bqf'
  use {
    'NTBBloodbath/rest.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    ft = 'http'
  }
  use 'lewis6991/impatient.nvim'
end)

local import = function()
  require('plugins.lua.autopairs')
  require('plugins.lua.bqf')
  require('plugins.lua.cmp')
  require('plugins.lua.colorizer')
  require('plugins.lua.gitsigns')
  require('plugins.lua.hop')
  require('plugins.lua.lspconfig')
  require('plugins.lua.lualine')
  require('plugins.lua.navigator')
  require('plugins.lua.treesitter')

  require('plugins.vimscript.dadbod')
  require('plugins.vimscript.easy-align')
  require('plugins.vimscript.fugitive')
  require('plugins.vimscript.fzf')
  require('plugins.vimscript.gutentags')
  require('plugins.vimscript.gv')
  require('plugins.vimscript.matchup')
  require('plugins.vimscript.merginal')
  require('plugins.vimscript.projectionist')
  require('plugins.vimscript.splitjoin')
  require('plugins.vimscript.test')
  require('plugins.vimscript.vsnip')
end

return {
  import = import
}
