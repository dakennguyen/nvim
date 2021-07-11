function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- Group: Theme
  use { 'kyazdani42/nvim-web-devicons', config = "require'nvim-web-devicons'.setup {}" }
  use 'dakennguyen/statusline'
  use 'dakennguyen/iceberg.vim'

  -- Group: Development
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'tpope/vim-unimpaired'
  use 'ntpeters/vim-better-whitespace'
  use 'ludovicchabant/vim-gutentags'
  use 'AndrewRadev/splitjoin.vim'
  use 'vim-test/vim-test'
  use 'windwp/nvim-autopairs'
  use 'kevinhwang91/nvim-bqf'

  -- Group: Language support
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'

  -- Group: Navigator
  use { 'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}} }
  use 'nvim-telescope/telescope-fzy-native.nvim'
  use 'phaazon/hop.nvim'
  use { 'junegunn/fzf', run = function() vim.fn['fzf#install']() end }
  use 'junegunn/fzf.vim'
  use 'tpope/vim-projectionist'
  use 'numToStr/Navigator.nvim'
  use 'kyazdani42/nvim-tree.lua'

  -- Group: Editor
  use 'arecarn/vim-clean-fold'
  use 'szw/vim-maximizer'
  use 'arecarn/vim-fold-cycle'
  use 'gcmt/taboo.vim'
  use { 'norcalli/nvim-colorizer.lua', config = "require'colorizer'.setup()" }
  use 'folke/lsp-colors.nvim'
  use 'junegunn/vim-easy-align'

  -- Group: Git
  use 'tpope/vim-fugitive'
  use 'junegunn/gv.vim'
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' }, config = "require('gitsigns').setup()" }
  use { 'ruifm/gitlinker.nvim', requires = 'nvim-lua/plenary.nvim' }

  -- Group: Miscellaneous
  use 'tpope/vim-obsession'
  use 'tpope/vim-abolish'
  use { 'tpope/vim-repeat', branch = 'no-feedkeys' }
  use 'benmills/vimux'
  use { 'xolox/vim-notes', requires = 'xolox/vim-misc' }
  use 'akinsho/nvim-toggleterm.lua'
  use { 'iamcco/markdown-preview.nvim', run = 'cd app & yarn install' }
end)

require('settings')
require('functions')

-- #############################################
-- Section: Mappings
-- #############################################

-- General
map('n', '<leader><space>', ':noh<cr>', { noremap = true, silent = true })
map('v', '*', [[y/\V<C-R>=escape(@",'/\')<CR><CR>]])
map('n', 'ss', ':w<cr>', { noremap = true, silent = true })

-- gq
map('n', 'gq', ':q<cr><c-w><c-p>', { silent = true })
vim.cmd[[autocmd BufReadPost quickfix nnoremap <buffer> gq :q<CR>]]

-- gf
map('', 'gff', 'gf',       { noremap = true })
map('', 'gfv', '<c-w>vgf', { noremap = true })
map('', 'gfs', '<c-w>f',   { noremap = true })
map('', 'gft', '<c-w>gf',  { noremap = true })

-- gd
-- map('', 'gdd', 'gd', { noremap = true })

-- quickfix
map('n', '<leader>c', ':copen<cr>', { noremap = true, silent = true })

-- Tab
map('n', '<leader>t', ':tabnew<cr>', { silent = true })
map('n', '<C-N>', 'gt')
map('n', '<C-T>', 'gT')

-- Mark
map('n', [[']], [["'" . nr2char(getchar()) . "zt"]], { expr = true })
map('n', [[`]], [["`" . nr2char(getchar()) . "zt"]], { expr = true })

-- registers
map('', 'gp', '"0p')
map('', 'gP', '"0P')
map('', '<leader>y', '"*y')
-- map('n', '<leader>p', '"*p')

-- resize panes
map('n', '<Up>',    ':10winc +<CR>')
map('n', '<Down>',  ':10winc -<CR>')
map('n', '<Left>',  ':10winc <<CR>')
map('n', '<Right>', ':10winc ><CR>')

-- File
map('n', '<leader>fc',  [[ :saveas <C-R>=expand("%:p:h")<CR>/              ]] )                    -- File > Save As
map('n', '<leader>fyy', [[ :let @+=expand("%") | echo @+<CR>               ]] , { silent = true }) -- File > Copy > Relative File Path
map('n', '<leader>fyf', [[ ggVG"*y<c-o>                                    ]] , { silent = true }) -- File > Copy > File Content
-- map('n', '<leader>fyd', [[ :let @+=expand("%:h") | echo @+<CR>             ]] , { silent = true }) -- File > Copy > Directory Path
-- map('n', '<leader>fyl', [[ :let @+=expand("%").":".line(".") | echo @+<CR> ]] , { silent = true }) -- File > Copy > Relative File Path with Line number
-- map('n', '<leader>fyY', [[ :let @+=expand("%:p") | echo @+<CR>             ]] , { silent = true }) -- File > Copy > Full File Path
-- map('n', '<leader>fyn', [[ :let @+=expand("%:t:r") | echo @+<CR>           ]] , { silent = true }) -- File > Copy > File Name without extension
-- map('n', '<leader>fyN', [[ :let @+=expand("%:t") | echo @+<CR>             ]] , { silent = true }) -- File > Copy > File Name with extension

-- open files
map('n', 'gs', ':topleft 18 new ~/.dotfiles/scratch.vim<CR>', { silent = true })
map('n', '<leader>s', ':source ~/.config/nvim/init.lua<CR>:PackerCompile<cr>')
-- map('n', '<leader>ev', ':vsplit ~/.config/nvim/init.lua<cr>')

-- Ruby
map('n', '<leader>rr', ':call VimuxRunCommand(\'ruby\' . \' \' . expand(\"%\"))<CR>')

-- debugger
map('i', 'bb', 'debugger<esc>')



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
map('n', 'gn', ':80vs note:home<cr>:MostRecentNote<cr><cr>', { silent = true })

-- ==========================================
-- use 'gcmt/taboo.vim'
-- ==========================================
vim.opt.sessionoptions:append { 'tabpages', 'globals' }
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
vim.g.splitjoin_split_mapping = 'gj'
vim.g.splitjoin_join_mapping  = 'gk'

-- ==========================================
-- use 'ntpeters/vim-better-whitespace'
-- ==========================================
vim.g.strip_whitespace_on_save = 1
vim.g.strip_whitespace_confirm = 0
vim.g.better_whitespace_enabled = 1
vim.g.strip_max_file_size = 0

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
vim.cmd [[command! -nargs=* Glg Git --paginate log --oneline --decorate --graph --all <args>]]
map('n', 'gb', ':Git blame<CR>', { silent = true })               -- Git Blame
map('n', '<leader>gd', ':Gdiffsplit<CR>', { silent = true })      -- Git diff

-- ==========================================
-- use 'junegunn/gv.vim'
-- ==========================================
map('n', '<leader>gv', ':GV!<CR>', { silent = true })             -- GV
map('v', '<leader>gv', ':GV<CR>',  { silent = true })             -- GV in Visual mode

-- ==========================================
-- use 'iamcco/markdown-preview.nvim'
-- ==========================================
map('n', '<leader>fp', [[:MarkdownPreview<CR>]], { silent = true })

require('plugins/autopairs')
require('plugins/compe')
require('plugins/gitlinker')
require('plugins/hop')
require('plugins/lspconfig')
require('plugins/navigator')
require('plugins/nvim-tree')
require('plugins/statusline')
require('plugins/telescope')
require('plugins/toggleterm')
require('plugins/treesitter')

require('plugins/fzf')
require('plugins/projectionist')

require('theme')
