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
      ["<C-\\>"] = "actions.open_terminal",
      ["`"] = {
        callback = function()
          local oil = require "oil"
          local util = require "oil.util"
          local fs = require "oil.fs"
          local entry = oil.get_cursor_entry()
          local bufname = vim.api.nvim_buf_get_name(0)
          local _, path = util.parse_url(bufname)
          if not path then return end
          local fullpath = fs.posix_to_os_path(path) .. entry.name

          local escaped = vim.api.nvim_replace_termcodes(
            ":Dispatch "
              .. vim.fn.fnameescape(fullpath)
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
