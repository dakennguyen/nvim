local colors = require('config.theme').tabline

map('n', '<leader>rn', ':lua require("tabline.actions").set_tabname()<CR>')
vim.cmd[[command! TabnameClear lua require("tabline.actions").clear_tabname()]]

require('tabline').setup{
  modified_icon = '●',
  close_icon = 'x',
  separator = '▎',
  padding = 1,
}

if colors then
  highlight('TabLineFill',                      { bg = colors.default_bg })

  highlight('TabLineSel',                       { bg = colors.active_bg, fg = colors.active_fg })
  highlight('TabLineSeparatorActive',           { fg = colors.active_fg })
  highlight('TabLineCloseActive',               { fg = colors.active_fg })
  highlight('TabLineModifiedActive',            { fg = colors.active_fg })
  highlight('TabLineModifiedSeparatorActive',   { fg = colors.active_fg })

  highlight('TabLine',                          { bg = colors.default_bg, fg = colors.inactive_fg })
  highlight('TabLineSeparatorInactive',         { fg = colors.separator, bg = colors.default_bg })
  highlight('TabLineCloseInactive',             { bg = colors.default_bg, fg = colors.inactive_fg })
  highlight('TabLineModifiedSeparatorInactive', { fg = colors.inactive_fg })
  highlight('TabLinePaddingInactive',           { bg = colors.default_bg })
end
