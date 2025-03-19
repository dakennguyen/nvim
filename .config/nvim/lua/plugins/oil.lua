return {
  "stevearc/oil.nvim",
  lazy = false, -- NOTE: cannot lazy loading for navigating with `:e`
  keys = {
    { "-", "<cmd>Oil<cr>" },
  },
  opts = {
    keymaps = {
      ["<C-v>"] = "actions.select_vsplit",
      ["<C-s>"] = "actions.select_split",
      ["<C-t>"] = { callback = "actions.select_tab", nowait = true },
      ["<C-p>"] = "actions.preview",
      ["gq"] = "actions.close",
      ["<leader>0"] = "actions.refresh",
      ["<C-h>"] = false,
      ["<C-l>"] = false,
      ["gs"] = false,
      ["<C-x>"] = "actions.change_sort",
      ["`"] = {
        callback = function()
          local util = require "oil.util"
          local bufname = vim.api.nvim_buf_get_name(0)
          local _, path = util.parse_url(bufname)
          if not path then return end

          local escaped = vim.api.nvim_replace_termcodes(
            ":Dispatch "
              .. "'"
              .. vim.fn.fnameescape(path)
              .. "'"
              .. "<Home><Right><Right><Right><Right><Right><Right><Right><Right><Space>",
            true,
            false,
            true
          )
          vim.api.nvim_feedkeys(escaped, "n", false)
        end,
        nowait = true,
      },
    },
    delete_to_trash = true,
    view_options = {
      show_hidden = true,
    },
  },
}
