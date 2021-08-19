local o = vim.opt
local g = vim.g

local disabled_built_ins = {
   "netrw",
   "netrwPlugin",
   "netrwSettings",
   "netrwFileHandlers",
   "gzip",
   "zip",
   "zipPlugin",
   "tar",
   "tarPlugin",
   "getscript",
   "getscriptPlugin",
   "vimball",
   "vimballPlugin",
   "2html_plugin",
   "logipat",
   "rrhelper",
   "spellfile_plugin",
   "matchit",
}

for _, plugin in pairs(disabled_built_ins) do
   g["loaded_" .. plugin] = 1
end

g.loaded_ruby_provider = 0
-- set tags=./tags;,tags;

-- filetype plugin indent on
-- syntax on

o.swapfile = false
o.number = true
o.relativenumber = true
o.regexpengine = 0
o.expandtab = true
o.tabstop = 8
o.softtabstop = 2
o.shiftwidth= 2
o.autoread = true
-- o.smartindent = true
o.autoindent = true
o.cursorline = true
o.wildmenu = true
o.splitbelow = true
o.splitright = true
o.exrc = true                  -- Enable reading local .nvimrc
o.scrolloff = 5                -- Scrolloff
o.mouse = 'a'                  -- Scroll with mouse
o.wrap = true

-- buffer
o.switchbuf:append { 'useopen' }

-- Theme
o.encoding = 'UTF-8'
o.laststatus=2
o.termguicolors = true

-- Fold
o.foldenable = true
o.foldlevelstart = 5
o.foldnestmax = 5
o.foldmethod= 'indent'
-- o.foldexpr= 'nvim_treesitter#foldexpr()'

-- Search
o.incsearch = true
o.hlsearch = true
o.inccommand = 'split'
o.ignorecase = true
o.smartcase = true

-- term
vim.cmd[[
augroup General
  autocmd!
  autocmd TermOpen * startinsert
  autocmd TermOpen * setlocal nonumber norelativenumber
augroup END
]]

o.hidden = true
o.signcolumn = 'yes'
o.cmdheight = 1

-- coc
o.backup = false
o.writebackup = false
o.updatetime = 300
o.shortmess:append { c = true }         -- set shortmess+=c

-- nvr
vim.cmd[[
if has('nvim')
  let $GIT_EDITOR = 'nvr -cc vsplit --remote-wait'
endif

augroup Nvr
  autocmd!
  autocmd FileType gitcommit,gitrebase,gitconfig set bufhidden=delete
augroup END
]]

g.mapleader = ','
