vim.pack.add { "https://github.com/dakennguyen/gitsigns.nvim" }

require("gitsigns").setup {
  signs = {
    add = { text = "▌" },
    change = { text = "▌" },
    delete = { text = "▁" },
    topdelete = { text = "▔" },
    changedelete = { text = "▌" },
  },
  signcolumn = false,
  numhl = true,
  on_attach = function(bufnr)
    local gs = require "gitsigns"

    local opts = { buffer = bufnr }

    -- Navigation
    vim.keymap.set("n", "]c", function()
      if vim.wo.diff then
        vim.cmd.normal { "]c", bang = true }
      else
        gs.nav_hunk "next"
      end
    end, opts)

    vim.keymap.set("n", "[c", function()
      if vim.wo.diff then
        vim.cmd.normal { "[c", bang = true }
      else
        gs.nav_hunk "prev"
      end
    end, opts)

    -- Actions
    vim.keymap.set("n", "<leader>hs", gs.stage_hunk, opts)
    vim.keymap.set("n", "<leader>hr", gs.reset_hunk, opts)
    vim.keymap.set("v", "<leader>hs", function() gs.stage_hunk { vim.fn.line ".", vim.fn.line "v" } end, opts)
    vim.keymap.set("v", "<leader>hr", function() gs.reset_hunk { vim.fn.line ".", vim.fn.line "v" } end, opts)
    vim.keymap.set("n", "<leader>hS", gs.stage_buffer, opts)
    vim.keymap.set("n", "<leader>hu", gs.undo_stage_hunk, opts)
    vim.keymap.set("n", "<leader>hU", gs.reset_buffer_index, opts)
    vim.keymap.set("n", "<leader>hR", gs.reset_buffer, opts)
    vim.keymap.set("n", "<leader>hp", gs.preview_hunk, opts)
    vim.keymap.set("n", "<leader>hb", function() gs.blame_line { full = true } end, opts)
    vim.keymap.set("n", "<leader>htb", gs.toggle_current_line_blame, opts)
    vim.keymap.set("n", "<leader>hd", gs.diffthis, opts)
    vim.keymap.set("n", "<leader>hD", function() gs.diffthis "~" end, opts)
    vim.keymap.set("n", "<leader>htd", gs.toggle_deleted, opts)

    -- Text object
    vim.keymap.set({ "o", "x" }, "ih", "<cmd>Gitsigns select_hunk<CR>")
  end,
}

local colors = require("themes").colors().gitsigns

if colors then
  vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = colors.add_fg })
  vim.api.nvim_set_hl(0, "GitSignsChange", { fg = colors.change_fg })
  vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = colors.delete_fg })
  vim.api.nvim_set_hl(0, "GitSignsAddNr", { fg = colors.add_fg, bg = colors.add_bg })
  vim.api.nvim_set_hl(0, "GitSignsChangeNr", { fg = colors.change_fg, bg = colors.change_bg })
  vim.api.nvim_set_hl(0, "GitSignsDeleteNr", { fg = colors.delete_fg, bg = colors.delete_bg })
end
