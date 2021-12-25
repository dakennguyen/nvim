local colors = require('config.theme').gitsigns

require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '┃', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '┃', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '▁', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '▔', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
}

if colors then
  highlight('GitSignsAddNr', { fg = colors.add_fg, bg = colors.add_bg })
  highlight('GitSignsChangeNr', { fg = colors.change_fg, bg = colors.change_bg })
  highlight('GitSignsDeleteNr', { fg = colors.delete_fg, bg = colors.delete_bg })
end
