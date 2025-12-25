vim.pack.add {
  "https://github.com/nvim-treesitter/nvim-treesitter",
  { src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects", version = "main" },
  "https://github.com/Wansmer/treesj",
  "https://github.com/mistweaverco/kulala.nvim",
}

local ensure_installed = {
  "bash",
  "dockerfile",
  "http",
  "javascript",
  "json",
  "lua",
  "nginx",
  "php",
  "python",
  "sql",
  "typescript",
  "vim",
  "vimdoc",
  "yaml",
  "zsh",
}
if ensure_installed and #ensure_installed > 0 then
  require("nvim-treesitter").install(ensure_installed)
  for _, parser in ipairs(ensure_installed) do
    vim.api.nvim_create_autocmd("FileType", {
      pattern = parser,
      callback = function()
        vim.treesitter.start()
        vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.wo[0][0].foldmethod = "expr"
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end
end

-- ##########################
-- nvim-treesitter-textobjects
-- ##########################
local select = require "nvim-treesitter-textobjects.select"
vim.keymap.set({ "x", "o" }, "am", function() select.select_textobject("@function.outer", "textobjects") end)
vim.keymap.set({ "x", "o" }, "im", function() select.select_textobject("@function.inner", "textobjects") end)
vim.keymap.set({ "x", "o" }, "ac", function() select.select_textobject("@class.outer", "textobjects") end)
vim.keymap.set({ "x", "o" }, "ic", function() select.select_textobject("@class.inner", "textobjects") end)
vim.keymap.set({ "x", "o" }, "as", function() select.select_textobject("@local.scope", "locals") end)

local move = require "nvim-treesitter-textobjects.move"
local mode = { "n", "x", "o" }
vim.keymap.set(mode, "]m", function() move.goto_next_start("@function.outer", "textobjects") end)
vim.keymap.set(mode, "]]", function() move.goto_next_start("@class.outer", "textobjects") end)
vim.keymap.set(mode, "]o", function() move.goto_next_start({ "@loop.inner", "@loop.outer" }, "textobjects") end)
vim.keymap.set(mode, "]s", function() move.goto_next_start("@local.scope", "locals") end)
vim.keymap.set(mode, "]z", function() move.goto_next_start("@fold", "folds") end)

vim.keymap.set(mode, "]M", function() move.goto_next_end("@function.outer", "textobjects") end)
vim.keymap.set(mode, "][", function() move.goto_next_end("@class.outer", "textobjects") end)

vim.keymap.set(mode, "[m", function() move.goto_previous_start("@function.outer", "textobjects") end)
vim.keymap.set(mode, "[[", function() move.goto_previous_start("@class.outer", "textobjects") end)

vim.keymap.set(mode, "[M", function() move.goto_previous_end("@function.outer", "textobjects") end)
vim.keymap.set(mode, "[]", function() move.goto_previous_end("@class.outer", "textobjects") end)

vim.keymap.set(mode, "]d", function() move.goto_next("@conditional.outer", "textobjects") end)
vim.keymap.set(mode, "[d", function() move.goto_previous("@conditional.outer", "textobjects") end)

-- ##########################
-- treesj
-- ##########################
require("treesj").setup {
  use_default_keymaps = false,
  max_join_length = 9999,
}
vim.keymap.set("n", "]j", "<cmd>TSJSplit<cr>")
vim.keymap.set("n", "[j", "<cmd>TSJJoin<cr>")

-- ##########################
-- kulala
-- ##########################
vim.keymap.set("n", "<space>ro", "<cmd>lua require('kulala').open()<cr>", { silent = true })
vim.keymap.set("n", "<space>rl", "<cmd>lua require('kulala').replay()<cr>", { silent = true })

require("kulala").setup {
  global_keymaps = false,
  display_mode = "float",
  kulala_keymaps = {
    ["Show verbose"] = { "D", function() require("kulala.ui").show_verbose() end },
  },
}
