local mode
if vim.loop.os_uname().sysname ~= "Darwin" then
  mode = os.getenv("THEME_MODE") or "light"
else
  local result = vim.fn.system("defaults read -g AppleInterfaceStyle 2>/dev/null")
  mode = result:match("^Dark") and "dark" or "light"
end

vim.o.background = mode
return require("themes." .. (os.getenv("THEME_" .. mode:upper()) or "default"))
