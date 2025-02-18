local ok, theme_mode = pcall(require, "themes.mode")

if not ok then theme_mode = {
  light_theme = "default",
  dark_theme = "default",
} end

if vim.o.background == "light" then
  return require("themes." .. theme_mode.light_theme)
else
  return require("themes." .. theme_mode.dark_theme)
end
