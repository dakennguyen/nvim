local o = vim.opt
local g = vim.g

local disabled_built_ins = {
   -- "netrw",
   -- "netrwPlugin",
   -- "netrwSettings",
   -- "netrwFileHandlers",
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

g.mapleader = ','
g.loaded_ruby_provider = 0
o.swapfile = false
o.signcolumn = 'yes'
o.number = true
o.relativenumber = true
o.expandtab = true
o.softtabstop = 2
o.shiftwidth= 2
o.cursorline = true
o.splitbelow = true
o.splitright = true
o.scrolloff = 5
o.mouse = 'a'

-- buffer
o.switchbuf:append { 'useopen' }

-- Theme
o.encoding = 'UTF-8'
o.termguicolors = true
o.showmode = false

-- Fold
o.foldenable = true
o.foldlevelstart = 5
o.foldnestmax = 5
o.foldmethod= 'indent'
-- o.foldexpr= 'nvim_treesitter#foldexpr()'

-- Search
o.ignorecase = true
o.smartcase = true

-- term
augroup('Terminal', {
  event = 'TermOpen',
  pattern = 'term://*',
  command = function()
    vim.cmd('startinsert')
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end,
})

-- netrw
g.netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

-- nvr
vim.cmd[[
if has('nvim')
  let $GIT_EDITOR = 'nvr -cc vsplit --remote-wait'
endif
]]

augroup('Nvr', {
  event = 'FileType',
  pattern = 'gitcommit,gitrebase,gitconfig',
  command = function()
    vim.opt.bufhidden = 'delete'
  end,
})

-- markdown
g.markdown_fenced_languages = { 'ruby', 'sql', 'bash' }
