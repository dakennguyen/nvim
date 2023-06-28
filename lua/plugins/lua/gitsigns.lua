return {
  "lewis6991/gitsigns.nvim",
  dependencies = "nvim-lua/plenary.nvim",
  init = lazy_load "gitsigns.nvim",
  opts = {
    signs = {
      add = { hl = "GitSignsAdd", text = "┃", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
      change = { hl = "GitSignsChange", text = "┃", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
      delete = { hl = "GitSignsDelete", text = "▁", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
      topdelete = { hl = "GitSignsDelete", text = "▔", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
      changedelete = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    },
    signcolumn = false,
    numhl = true,
    on_attach = function(bufnr)
      local function map(mode, lhs, rhs, opts)
        opts = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
        vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
      end

      -- Navigation
      map("n", "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
      map("n", "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })

      -- Actions
      map("n", "<leader>hs", "<cmd>Gitsigns stage_hunk<CR>")
      map("v", "<leader>hs", "<cmd>Gitsigns stage_hunk<CR>")
      map("n", "<leader>hr", "<cmd>Gitsigns reset_hunk<CR>")
      map("v", "<leader>hr", "<cmd>Gitsigns reset_hunk<CR>")
      map("n", "<leader>hS", "<cmd>Gitsigns stage_buffer<CR>")
      map("n", "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<CR>")
      map("n", "<leader>hU", "<cmd>Gitsigns reset_buffer_index<CR>")
      map("n", "<leader>hR", "<cmd>Gitsigns reset_buffer<CR>")
      map("n", "<leader>hp", "<cmd>Gitsigns preview_hunk<CR>")
      map("n", "<leader>hb", '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
      -- map('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>')
      map("n", "<leader>hd", "<cmd>Gitsigns diffthis<CR>")
      map("n", "<leader>hD", '<cmd>lua require"gitsigns".diffthis("~")<CR>')
      -- map('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>')

      -- Text object
      map("o", "ih", ":<C-U>Gitsigns select_hunk<CR>")
      map("x", "ih", ":<C-U>Gitsigns select_hunk<CR>")
    end,
  },
  config = function(_, opts)
    require("gitsigns").setup(opts)

    local colors = require("config.theme").gitsigns

    if colors then
      highlight("GitSignsAddNr", { fg = colors.add_fg, bg = colors.add_bg })
      highlight("GitSignsChangeNr", { fg = colors.change_fg, bg = colors.change_bg })
      highlight("GitSignsDeleteNr", { fg = colors.delete_fg, bg = colors.delete_bg })
    end
  end,
}
