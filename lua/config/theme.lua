local theme_mode = require "config.mode"

if vim.o.background == "light" then
  return require("themes." .. theme_mode.light_theme)
else
  return require("themes." .. theme_mode.dark_theme)
end

-- ### mode.lua example
-- vim.opt.background = 'dark'

-- return {
--   light_theme = "github_light",
--   dark_theme = "doom_one",
-- }
