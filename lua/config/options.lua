vim.g.mapleader = ","
vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.opt.swapfile = false
vim.opt.signcolumn = "auto"
vim.opt.hlsearch = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 5
vim.opt.wildmode = { "list:longest", "list:full" }
vim.opt.diffopt:append { "context:99999" }
vim.opt.diffopt:remove { "linematch:40" }
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.list = true
vim.opt.listchars = { tab = "→ ", trail = "·" }
vim.opt.exrc = true
vim.opt.secure = true

-- buffer
-- o.switchbuf:append { "useopen" }

-- Fold
vim.opt.foldlevel = 99
vim.opt.foldnestmax = 5
vim.opt.foldmethod = "indent"
vim.opt.foldopen:remove { "hor", "search" }
vim.opt.foldtext = "v:lua.fold_text()"
vim.opt.fillchars:append { fold = " " }

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- netrw
vim.g.netrw_bufsettings = "noma nomod nu nobl nowrap ro"

-- markdown
vim.g.markdown_fenced_languages = { "ruby", "sql", "bash" }
