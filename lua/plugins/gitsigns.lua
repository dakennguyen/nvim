return {
  "lewis6991/gitsigns.nvim",
  tag = "v0.8.1",
  init = _G.lazy_load "gitsigns.nvim",
  opts = {
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
      map("n", "]c", function()
        if vim.wo.diff then
          vim.cmd.normal { "]c", bang = true }
        else
          gs.nav_hunk "next"
        end
      end, opts)

      map("n", "[c", function()
        if vim.wo.diff then
          vim.cmd.normal { "[c", bang = true }
        else
          gs.nav_hunk "prev"
        end
      end, opts)

      -- Actions
      map("n", "<leader>hs", gs.stage_hunk, opts)
      map("n", "<leader>hr", gs.reset_hunk, opts)
      map("v", "<leader>hs", function() gs.stage_hunk { vim.fn.line ".", vim.fn.line "v" } end, opts)
      map("v", "<leader>hr", function() gs.reset_hunk { vim.fn.line ".", vim.fn.line "v" } end, opts)
      map("n", "<leader>hS", gs.stage_buffer, opts)
      map("n", "<leader>hu", gs.undo_stage_hunk, opts)
      map("n", "<leader>hU", gs.reset_buffer_index, opts)
      map("n", "<leader>hR", gs.reset_buffer, opts)
      map("n", "<leader>hp", gs.preview_hunk, opts)
      map("n", "<leader>hb", function() gs.blame_line { full = true } end, opts)
      map("n", "<leader>htb", gs.toggle_current_line_blame, opts)
      map("n", "<leader>hd", gs.diffthis, opts)
      map("n", "<leader>hD", function() gs.diffthis "~" end, opts)
      map("n", "<leader>htd", gs.toggle_deleted, opts)

      -- Text object
      map({ "o", "x" }, "ih", "<cmd>Gitsigns select_hunk<CR>")
    end,
  },
  config = function(_, opts)
    require("gitsigns").setup(opts)

    local colors = require("themes").colors().gitsigns

    if colors then
      vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = colors.add_fg })
      vim.api.nvim_set_hl(0, "GitSignsChange", { fg = colors.change_fg })
      vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = colors.delete_fg })
      vim.api.nvim_set_hl(0, "GitSignsAddNr", { fg = colors.add_fg, bg = colors.add_bg })
      vim.api.nvim_set_hl(0, "GitSignsChangeNr", { fg = colors.change_fg, bg = colors.change_bg })
      vim.api.nvim_set_hl(0, "GitSignsDeleteNr", { fg = colors.delete_fg, bg = colors.delete_bg })
    end
  end,
}
