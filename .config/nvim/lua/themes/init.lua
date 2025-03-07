vim.opt.background = os.getenv "THEME_MODE" or "light"

local theme
if vim.o.background == "light" then
  theme = require("themes." .. (os.getenv "THEME_LIGHT" or "default"))
else
  theme = require("themes." .. (os.getenv "THEME_DARK" or "default"))
end

theme.lualine_theme = os.getenv "THEME_LUALINE" or "bubble"

return theme
