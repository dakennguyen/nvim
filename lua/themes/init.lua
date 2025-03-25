local theme_mode = os.getenv "THEME_MODE" or "light"
vim.opt.background = theme_mode

local theme_name = os.getenv(theme_mode == "light" and "THEME_LIGHT" or "THEME_DARK") or "default"

return require("themes." .. theme_name)
