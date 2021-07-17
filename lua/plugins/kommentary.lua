require('kommentary.config').configure_language("default", {
  prefer_single_line_comments = true,
})

vim.g.kommentary_create_default_mappings = false
map("n", "gcc", "<Plug>kommentary_line_default",       { noremap = false })
map("n", "gc", "<Plug>kommentary_motion_default",      { noremap = false })
map("v", "gc", "<Plug>kommentary_visual_default<esc>", { noremap = false })
