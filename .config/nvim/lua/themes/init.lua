local ok, theme_mode = pcall(require, "themes.mode")

if not ok then theme_mode = {
  light_theme = "default",
  dark_theme = "default",
  lualine_theme = "bubble",
} end

local theme
if vim.o.background == "light" then
  theme = require("themes." .. theme_mode.light_theme)
else
  theme = require("themes." .. theme_mode.dark_theme)
end

theme.lualine_theme = theme_mode.lualine_theme

return theme
