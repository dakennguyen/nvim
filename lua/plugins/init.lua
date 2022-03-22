require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- Group: Theme
  use { 'kyazdani42/nvim-web-devicons', config = "require'nvim-web-devicons'.setup {}" }
  use 'nvim-lualine/lualine.nvim'
  use 'rmehri01/onenord.nvim'
  -- use 'shaunsingh/nord.nvim'
  -- use 'Th3Whit3Wolf/one-nvim'
  -- use 'romgrk/github-light.vim'

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
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'neovim/nvim-lspconfig'
  use 'ludovicchabant/vim-gutentags'
  use {
    'JoosepAlviste/nvim-ts-context-commentstring',
    ft = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' }
  }
  use 'andymass/vim-matchup'

  -- Group: Completion
  use 'github/copilot.vim'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'

  -- Group: Framework support
  use 'vim-test/vim-test'

  -- Group: Editing support
  use 'windwp/nvim-autopairs'
  use {
    'windwp/nvim-ts-autotag',
    ft = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' }
  }
  use 'AndrewRadev/splitjoin.vim'
  use 'junegunn/vim-easy-align'
  use 'ntpeters/vim-better-whitespace'

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
  use 'benmills/vimux'
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

  require('plugins.vimscript.better-whitespace')
  require('plugins.vimscript.copilot')
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
  require('plugins.vimscript.vimux')
end

return {
  import = import
}
