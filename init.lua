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
  use 'tpope/vim-vinegar'
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

  -- Group: Navigator
  use { 'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}} }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
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
-- use 'AndrewRadev/splitjoin.vim'
-- ==========================================
vim.g.splitjoin_split_mapping = ']s'
vim.g.splitjoin_join_mapping  = '[s'

-- ==========================================
-- use 'ludovicchabant/vim-gutentags'
-- ==========================================
--vim.g.gutentags_cache_dir = get(g:, 'gutentags_cache_dir', expand('~/.cache/tags'))
vim.g.gutentags_ctags_exclude = { '*.min.js', '*.min.css', 'build', 'vendor', '.git', 'node_modules', '*.vim/bundle/*' }

-- ==========================================
-- use 'vim-test/vim-test'
-- ==========================================
vim.g["test#strategy"] = "neovim"
vim.g["test#neovim#term_position"] = "vert"

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
map('n', 'gb', ':Git blame<CR>',                { silent = true }) -- Git Blame
map('n', '<leader>gg', ':vertical G<CR>',       { silent = true }) -- Git
map('n', '<leader>gl', ':Gclog -n 100',         { silent = true }) -- Git log
map('n', '<leader>glg', ':tab Git log --oneline --graph --all --decorate --abbrev-commit<CR>', { silent = true }) -- Git log
map('n', '<leader>gd', ':tab Git diff')                            -- Git diff
map('n', '<leader>gs', ':Glog -g stash<CR>',    { silent = true }) -- Git stash
map('n', '<leader>gt', ':0Gclog<CR>',           { silent = true }) -- Git time machine
map('n', '<leader>gx', ':GBrowse<CR>',          { silent = true }) -- Git Browse
map('v', '<leader>gx', ':GBrowse<CR>',          { silent = true }) -- Git Browse in Visual mode
map('n', '<leader>gf', ':diffget //2<cr>')
map('n', '<leader>gj', ':diffget //3<cr>')
vim.cmd[[
  augroup fugitive_mapping
    autocmd!
    autocmd filetype fugitive call FugitiveMapping()
  augroup END

  function! FugitiveMapping()
    silent! unmap <buffer> cp
    nnoremap <buffer> cp<space> :Git pull<space>
    nnoremap <buffer> cP<space> :Git push<space>
  endfunction
]]

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

-- ==========================================
-- use 'andymass/vim-matchup'
-- ==========================================
vim.g.matchup_matchparen_offscreen = {}

-- #############################################
-- #############################################

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
require('plugins/vim-projectionist')

require('theme')
