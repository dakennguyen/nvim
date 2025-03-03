local o = vim.opt
local g = vim.g

g.mapleader = ","
g.loaded_python3_provider = 0
g.loaded_node_provider = 0
g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0
o.swapfile = false
o.signcolumn = "auto"
o.hlsearch = false
o.number = true
o.relativenumber = true
o.cursorline = true
o.scrolloff = 5
o.mouse = "a"
o.exrc = true

-- buffer
-- o.switchbuf:append { "useopen" }

-- Theme
o.encoding = "UTF-8"
o.showmode = false

-- Fold
o.foldlevelstart = 5
o.foldnestmax = 5
o.foldmethod = "indent"
o.foldopen:remove { "hor", "search" }
o.foldtext = "v:lua.fold_text()"
o.fillchars:append { fold = " " }

-- Search
o.ignorecase = true
o.smartcase = true

-- netrw
g.netrw_bufsettings = "noma nomod nu nobl nowrap ro"

-- markdown
g.markdown_fenced_languages = { "ruby", "sql", "bash" }
