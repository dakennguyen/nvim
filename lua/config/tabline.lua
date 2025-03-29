vim.o.showtabline = 2

local icons = require "icons"

local M = {}

local cwd = function()
  local cwd = vim.fn.getcwd()
  local prefix = ""
  local prefix_path = ""
  local special_dirs = {
    [icons.misc.project .. " "] = vim.env.HOME .. "/projects",
    [icons.misc.home .. " "] = vim.env.HOME,
  }

  for dir_name, dir_path in pairs(special_dirs) do
    if vim.startswith(cwd, vim.fs.normalize(dir_path)) and #dir_path > #prefix_path then
      prefix, prefix_path = dir_name, dir_path
    end
  end
  cwd = cwd:gsub("^" .. prefix_path, prefix)

  local parts = vim.split(cwd, "/")
  return table.concat(parts, " ")
end

local tabs_indicator = function()
  local s = ""
  for i = 1, vim.fn.tabpagenr "$" do
    local hl = (i == vim.fn.tabpagenr()) and "%#TabLineSel#" or "%#TabLine#"
    s = s .. hl .. " " .. i .. " "
  end
  return s
end

M.render = function() return cwd() .. "%=" .. tabs_indicator() end

vim.o.tabline = "%!v:lua.require'config.tabline'.render()"

return M
