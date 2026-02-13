local theme_mode = os.getenv "THEME_MODE" or "light"
vim.opt.background = theme_mode

local theme_name = os.getenv(theme_mode == "light" and "THEME_LIGHT" or "THEME_DARK")

local function theme_module_exists(name)
  if not name then return false end
  local base = "lua/themes/" .. name
  return #vim.api.nvim_get_runtime_file(base .. ".lua", false) > 0
    or #vim.api.nvim_get_runtime_file(base .. "/init.lua", false) > 0
end

local function colorscheme_exists(name)
  if not name then return false end
  local ok, _ = pcall(vim.cmd.colorscheme, name)
  return ok
end

if theme_module_exists(theme_name) then return require("themes." .. theme_name) end

if colorscheme_exists(theme_name) then
  return {
    setup = function() vim.cmd("colorscheme " .. theme_name) end,
    colors = function() return {} end,
  }
end

return {
  setup = function() vim.opt.termguicolors = false end,
  colors = function() return {} end,
}
