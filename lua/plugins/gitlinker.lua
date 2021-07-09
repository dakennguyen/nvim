require'gitlinker'.setup({
  opts = {
    add_current_line_on_normal_mode = false,
    action_callback = require"gitlinker.actions".open_in_browser,
  },
  mappings = "<leader>gl"
})
