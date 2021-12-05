local mode = 'dark'
vim.opt.background = mode

if mode == 'light' then
  return require 'config.theme_onenord_light'
else
  return require 'config.theme_onenord'
end
