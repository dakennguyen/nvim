local o = vim.opt
local g = vim.g

g.mapleader = ","
g.loaded_python3_provider = 0
g.loaded_node_provider = 0
g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0
o.swapfile = false
o.signcolumn = "auto"
o.number = true
o.relativenumber = true
o.expandtab = true
o.softtabstop = 2
o.shiftwidth = 2
o.cursorline = true
o.scrolloff = 5
o.modeline = false
o.mouse = "a"
o.exrc = true

-- buffer
-- o.switchbuf:append { "useopen" }

-- Theme
o.encoding = "UTF-8"
o.showmode = false

-- Fold
o.foldenable = true
o.foldlevelstart = 5
o.foldnestmax = 5
o.foldmethod = "indent"
o.foldopen:remove "search"
-- o.foldexpr= 'nvim_treesitter#foldexpr()'
o.foldtext = "v:lua.fold_text()"
o.fillchars:append { fold = " " }

-- Search
o.ignorecase = true
o.smartcase = true

-- netrw
g.netrw_bufsettings = "noma nomod nu nobl nowrap ro"

-- nvr
vim.cmd [[
if has('nvim')
  let $GIT_EDITOR = 'nvr -cc vsplit --remote-wait'
endif
]]

-- markdown
g.markdown_fenced_languages = { "ruby", "sql", "bash" }
