local icons = require "icons"

vim.api.nvim_set_hl(0, "Winbar", { bold = true })
vim.api.nvim_set_hl(0, "WinbarStandout", { bold = true, reverse = true })
vim.api.nvim_set_hl(0, "WinbarNC", { bold = true })

local M = {}

M.render = function()
  local icon = icons.symbol_kinds.File
  local devicons = package.loaded["nvim-web-devicons"] and require "nvim-web-devicons"
  local mini_icons = package.loaded["mini.icons"] and require "mini.icons"
  if devicons then
    local buf_name = vim.api.nvim_buf_get_name(0)
    local name, ext = vim.fn.fnamemodify(buf_name, ":t"), vim.fn.fnamemodify(buf_name, ":e")
    icon = devicons.get_icon(name, ext) or icons.symbol_kinds.File
  elseif mini_icons then
    icon = mini_icons.get("file", vim.api.nvim_buf_get_name(0)) or icons.symbol_kinds.File
  end

  local cwd = vim.fn.getcwd(vim.fn.winnr())
  local path = vim.fs.normalize(vim.fn.expand "%:.")

  if vim.startswith(path, "oil:") then
    icon = icons.symbol_kinds.Folder
    local escaped_cwd = cwd:gsub("([%.%-%+%*%?%^%$%(%)%[%]%%%|])", "%%%1")
    path = path:gsub("^oil:" .. escaped_cwd .. "$", ""):gsub("^oil:" .. escaped_cwd .. "/", "/")
  end
  if vim.startswith(path, "fugitive:") then icon = icons.misc.git end

  local full_path = vim.fs.normalize(vim.fn.expand "%:p")
  local in_workspace = vim.startswith(full_path, cwd) or vim.startswith(full_path, "oil:" .. cwd)
  local hl = in_workspace and "Winbar" or "WinbarStandout"

  if vim.api.nvim_win_get_width(0) < math.floor(vim.o.columns / 3) then path = vim.fn.pathshorten(path) end

  path = path:gsub("^/", ""):gsub("^", icon .. " ")
  local formatted_path = table.concat(
    vim.tbl_map(function(segment) return string.format("%%#%s#%s", hl, segment) end, vim.split(path, "/")),
    string.format(" %%#%s# ", hl)
  )

  return string.format("%%#%s# %s %%m", hl, formatted_path)
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
