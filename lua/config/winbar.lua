local icons = require "icons"
local utils = require "utils"

vim.api.nvim_set_hl(0, "Winbar", { bold = true })
vim.api.nvim_set_hl(0, "WinbarStandout", { bold = true, reverse = true })
vim.api.nvim_set_hl(0, "WinbarNC", { bold = true })
vim.api.nvim_set_hl(0, "RootDir", { bold = true, italic = true, fg = utils.get_hl("Comment").fg })

local M = {}

local function get_special_prefix(path, special_dirs)
  local prefix, longest_match = "", ""
  for key, dir in pairs(special_dirs) do
    local normalized_dir = vim.fs.normalize(dir)
    if vim.startswith(path, normalized_dir) and #normalized_dir > #longest_match then
      prefix, longest_match = key, normalized_dir
    end
  end
  if prefix ~= "" then path = path:gsub("^" .. longest_match, "") end
  return prefix, path
end

M.render = function()
  local cwd = vim.fn.getcwd(vim.fn.winnr())
  local path = vim.fs.normalize(vim.fn.expand "%:.")

  local full_path = vim.fs.normalize(vim.fn.expand "%:p")
  local in_workspace = vim.startswith(full_path, cwd) or vim.startswith(path, "oil:")
  local hl = in_workspace and "Winbar" or "WinbarStandout"

  if vim.startswith(path, "diffview") then return string.format("%%#Winbar#%s", path) end
  if vim.startswith(path, "oil:") then path = path:gsub("^oil:" .. cwd, "") end

  local special_dirs = {
    [icons.misc.project] = vim.env.HOME .. "/projects",
    [icons.misc.home] = vim.env.HOME,
  }

  local prefix, formatted_cwd
  if in_workspace then
    prefix, cwd = get_special_prefix(cwd, special_dirs)
    formatted_cwd = prefix ~= "" and string.format("%%#RootDir#%s %s 󰄾 ", prefix, cwd) or ""
  else
    prefix, path = get_special_prefix(path, special_dirs)
    formatted_cwd = string.format("%%#WinbarStandout# %s  ", prefix)
  end

  if vim.api.nvim_win_get_width(0) < math.floor(vim.o.columns / 3) then path = vim.fn.pathshorten(path) end

  path = path:gsub("^/", "")

  local formatted_path = table.concat(
    vim.tbl_map(function(segment) return string.format("%%#%s#%s", hl, segment) end, vim.split(path, "/")),
    string.format(" %%#%s# ", hl)
  )
  return table.concat { formatted_cwd, formatted_path, " %m" }
end

_G.augroup("my.winbar", {
  event = "BufWinEnter",
  desc = "Attach winbar",
  callback = function(args)
    if
      not vim.api.nvim_win_get_config(0).zindex -- Not a floating window
      and vim.bo[args.buf].buftype == "" -- Normal buffer
      and vim.api.nvim_buf_get_name(args.buf) ~= "" -- Has a file name
      and not vim.wo[0].diff -- Not in diff mode
    then
      vim.wo.winbar = "%{%v:lua.require'config.winbar'.render()%}"
    end
  end,
})

return M
