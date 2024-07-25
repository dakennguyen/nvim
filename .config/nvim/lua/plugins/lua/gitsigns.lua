return {
  "lewis6991/gitsigns.nvim",
  dependencies = "nvim-lua/plenary.nvim",
  init = _G.lazy_load "gitsigns.nvim",
  opts = {
    signs = {
      add = { text = "▌" },
      change = { text = "▌" },
      delete = { text = "▁" },
      topdelete = { text = "▔" },
      changedelete = { text = "▌" },
    },
    signs_staged_enable = false,
    signcolumn = false,
    numhl = true,
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map("n", "]c", function()
        if vim.wo.diff then
          return "]c"
        end
        vim.schedule(function()
          gs.next_hunk()
        end)
        return "<Ignore>"
      end, { expr = true })

      map("n", "[c", function()
        if vim.wo.diff then
          return "[c"
        end
        vim.schedule(function()
          gs.prev_hunk()
        end)
        return "<Ignore>"
      end, { expr = true })

      -- Actions
      map("n", "<leader>hs", gs.stage_hunk)
      map("n", "<leader>hr", gs.reset_hunk)
      map("v", "<leader>hs", function()
        gs.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
      end)
      map("v", "<leader>hr", function()
        gs.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
      end)
      map("n", "<leader>hS", gs.stage_buffer)
      map("n", "<leader>hu", gs.undo_stage_hunk)
      map("n", "<leader>hU", gs.reset_buffer_index)
      map("n", "<leader>hR", gs.reset_buffer)
      map("n", "<leader>hp", gs.preview_hunk)
      map("n", "<leader>hb", function()
        gs.blame_line { full = true }
      end)
      map("n", "<leader>htb", gs.toggle_current_line_blame)
      map("n", "<leader>hd", gs.diffthis)
      map("n", "<leader>hD", function()
        gs.diffthis "~"
      end)
      map("n", "<leader>htd", gs.toggle_deleted)

      -- Text object
      map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
    end,
  },
  config = function(_, opts)
    require("gitsigns").setup(opts)

    local colors = require("config.theme").gitsigns

    if colors then
      _G.highlight("GitSignsAdd", { fg = colors.add_fg })
      _G.highlight("GitSignsChange", { fg = colors.change_fg })
      _G.highlight("GitSignsDelete", { fg = colors.delete_fg })
      _G.highlight("GitSignsAddNr", { fg = colors.add_fg, bg = colors.add_bg })
      _G.highlight("GitSignsChangeNr", { fg = colors.change_fg, bg = colors.change_bg })
      _G.highlight("GitSignsDeleteNr", { fg = colors.delete_fg, bg = colors.delete_bg })
    end
  end,
}
