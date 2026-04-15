vim.pack.add { "https://github.com/nvim-treesitter/nvim-treesitter-textobjects" }

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

-- vim.keymap.set(mode, "]d", function() move.goto_next("@conditional.outer", "textobjects") end)
-- vim.keymap.set(mode, "[d", function() move.goto_previous("@conditional.outer", "textobjects") end)

local ts_repeat_move = require "nvim-treesitter-textobjects.repeatable_move"
vim.keymap.set(mode, ";", ts_repeat_move.repeat_last_move)
vim.keymap.set(mode, ",", ts_repeat_move.repeat_last_move_opposite)
vim.keymap.set(mode, "f", ts_repeat_move.builtin_f_expr, { expr = true })
vim.keymap.set(mode, "F", ts_repeat_move.builtin_F_expr, { expr = true })
vim.keymap.set(mode, "t", ts_repeat_move.builtin_t_expr, { expr = true })
vim.keymap.set(mode, "T", ts_repeat_move.builtin_T_expr, { expr = true })
