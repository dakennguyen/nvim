return {
  "dakennguyen/oil.nvim",
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
      ["!"] = "actions.open_cmdline",
    },
    delete_to_trash = true,
    view_options = {
      show_hidden = true,
    },
  },
  config = true,
}
