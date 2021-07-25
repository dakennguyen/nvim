require('kommentary.config').configure_language("default", {
  prefer_single_line_comments = true,
})

vim.g.kommentary_create_default_mappings = false
map("n", "gcc", "<Plug>kommentary_line_default",       { noremap = false })
map("n", "gc", "<Plug>kommentary_motion_default",      { noremap = false })
map("v", "gc", "<Plug>kommentary_visual_default<esc>", { noremap = false })

--[[ This is our custom function for toggling comments with a custom commentstring,
it's based on the default toggle_comment, but before calling the function for
toggling ranges, it sets the commenstring to something else. After it is done,
it sets it back to what it was before. ]]
function toggle_comment_custom_commentstring(...)
  local args = {...}
  -- Save the current value of commentstring so we can restore it later
  local commentstring = vim.bo.commentstring
  -- Set the commentstring for the current buffer to something new
  vim.bo.commentstring =  "{/*%s*/}"
  --[[ Call the function for toggling comments, which will resolve the config
  to the new commentstring and proceed with that. ]]
  require('kommentary.kommentary').toggle_comment_range(args[1], args[2],
      require('kommentary.config').get_modes().normal)
  -- Restore the original value of commentstring
  vim.api.nvim_buf_set_option(0, "commentstring", commentstring)
end

-- Set the extra mapping for toggling a single line in normal mode
vim.api.nvim_set_keymap('n', 'gCC',
'<cmd>lua require("kommentary");kommentary.go(' .. require('kommentary.config').context.line .. ', '
.. "'toggle_comment_custom_commentstring'" .. ')<cr>',
{ noremap = true, silent = true })
-- Set the extra mapping for toggling a range with a motion
vim.api.nvim_set_keymap('n', 'gC',
'v:lua.kommentary.go(' .. require('kommentary.config').context.init .. ', ' ..
"'toggle_comment_custom_commentstring'" .. ')',
{ noremap = true, expr = true })
-- Set the extra mapping for toggling a range with a visual selection
vim.api.nvim_set_keymap('v', 'gC',
'<cmd>lua require("kommentary");kommentary.go(' .. require('kommentary.config').context.visual .. ', '
.. "'toggle_comment_custom_commentstring'" .. ')<cr><esc>',
{ noremap = true, silent = true })
