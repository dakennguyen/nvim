local theme_mode = require "themes.mode"

if vim.o.background == "light" then
  return require("themes." .. theme_mode.light_theme)
else
  return require("themes." .. theme_mode.dark_theme)
end
