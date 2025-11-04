vim.pack.add {
  "https://github.com/nvim-treesitter/nvim-treesitter",
  { src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects", version = "main" },
  "https://github.com/Wansmer/treesj",
}

-- ##########################
-- nvim-treesitter
-- ##########################
-- npm install -g tree-sitter-cli
_G.augroup("TreesitterSetup", {
  event = "FileType",
  callback = function(event)
    -- Skip treesitter on large files
    -- local stats = vim.uv.fs_stat(vim.api.nvim_buf_get_name(event.buf))
    -- if vim.api.nvim_buf_line_count(event.buf) > 5000 or (stats and stats.size > 100 * 1024) then return end

    if not vim.api.nvim_buf_is_valid(event.buf) then return end

    local lang = vim.treesitter.language.get_lang(event.match) or event.match
    local ok_parsers, parser_configs = pcall(require, "nvim-treesitter.parsers")

    if lang ~= "kulala_http" then
      if not ok_parsers or not parser_configs[lang] then return end
      require("nvim-treesitter").install { lang }
    end

    local ok = pcall(vim.treesitter.start, event.buf, lang)
    if ok then
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
      vim.wo[0][0].foldmethod = "expr"
    end
  end,
})

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

-- vim.keymap.set(mode, "]d", function() move.goto_next("@conditional.outer", "textobjects") end)
-- vim.keymap.set(mode, "[d", function() move.goto_previous("@conditional.outer", "textobjects") end)

local ts_repeat_move = require "nvim-treesitter-textobjects.repeatable_move"
vim.keymap.set(mode, ";", ts_repeat_move.repeat_last_move)
vim.keymap.set(mode, ",", ts_repeat_move.repeat_last_move_opposite)
vim.keymap.set(mode, "f", ts_repeat_move.builtin_f_expr, { expr = true })
vim.keymap.set(mode, "F", ts_repeat_move.builtin_F_expr, { expr = true })
vim.keymap.set(mode, "t", ts_repeat_move.builtin_t_expr, { expr = true })
vim.keymap.set(mode, "T", ts_repeat_move.builtin_T_expr, { expr = true })

-- ##########################
-- treesj
-- ##########################
require("treesj").setup {
  use_default_keymaps = false,
  max_join_length = 9999,
}
vim.keymap.set("n", "]j", "<cmd>TSJSplit<cr>")
vim.keymap.set("n", "[j", "<cmd>TSJJoin<cr>")
