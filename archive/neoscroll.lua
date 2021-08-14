require('neoscroll').setup({
  mappings = {},
  respect_scrolloff = false,
  cursor_scrolls_alone = false,
})

local t = {}
t['<C-b>'] = {'scroll', {'-vim.wo.scroll', 'true', '100'}}
t['<C-f>'] = {'scroll', { 'vim.wo.scroll', 'true', '100'}}
require('neoscroll.config').set_mappings(t)
