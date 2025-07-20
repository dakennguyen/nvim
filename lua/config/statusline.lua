vim.o.showmode = false
vim.o.laststatus = 3

local icons = require "icons"
local utils = require "utils"

vim.api.nvim_set_hl(0, "Statusline", { link = "CursorLine" })
vim.api.nvim_set_hl(0, "StatuslineNC", { fg = utils.get_hl("VertSplit").fg, underline = true })

vim.api.nvim_set_hl(0, "StatuslineGitAdded", { link = "GitSignsAdd" })
vim.api.nvim_set_hl(0, "StatuslineGitModified", { link = "GitSignsChange" })
vim.api.nvim_set_hl(0, "StatuslineGitDeleted", { link = "GitSignsDelete" })

vim.api.nvim_set_hl(0, "StatuslineModeNormal", { bold = true, fg = utils.get_hl("Normal").fg })
vim.api.nvim_set_hl(0, "StatuslineModeInsert", { bold = true, fg = utils.get_hl("DiagnosticSignInfo").fg })
vim.api.nvim_set_hl(0, "StatuslineModeVisual", { bold = true, fg = utils.get_hl("DiagnosticSignWarn").fg })
vim.api.nvim_set_hl(0, "StatuslineModeReplace", { bold = true, fg = utils.get_hl("DiagnosticSignError").fg })
vim.api.nvim_set_hl(0, "StatuslineModeTerminal", { bold = true, fg = utils.get_hl("DiagnosticSignHint").fg })
vim.api.nvim_set_hl(0, "StatuslineModeCommand", { bold = true, fg = utils.get_hl("Function").fg })
vim.api.nvim_set_hl(0, "StatuslineModeOther", { bold = true, fg = utils.get_hl("Number").fg })

vim.api.nvim_set_hl(0, "StatuslineItalic", { italic = true })
vim.api.nvim_set_hl(0, "StatuslineTitle", { bold = true })
vim.api.nvim_set_hl(0, "StatuslineInactive", { link = "Comment" })

local M = {}
local last_diagnostic_component = ""

local mode_component = function()
  -- Note that: \19 = ^S and \22 = ^V.
  local mode_to_str = {
    ["n"] = "NORMAL",
    ["no"] = "OP-PENDING",
    ["nov"] = "OP-PENDING",
    ["noV"] = "OP-PENDING",
    ["no\22"] = "OP-PENDING",
    ["niI"] = "NORMAL",
    ["niR"] = "NORMAL",
    ["niV"] = "NORMAL",
    ["nt"] = "NORMAL",
    ["ntT"] = "NORMAL",
    ["v"] = "VISUAL",
    ["vs"] = "VISUAL",
    ["V"] = "V-LINE",
    ["Vs"] = "V-LINE",
    ["\22"] = "V-BLOCK",
    ["\22s"] = "V-BLOCK",
    ["s"] = "SELECT",
    ["S"] = "SELECT",
    ["\19"] = "SELECT",
    ["i"] = "INSERT",
    ["ic"] = "INSERT",
    ["ix"] = "INSERT",
    ["R"] = "REPLACE",
    ["Rc"] = "REPLACE",
    ["Rx"] = "REPLACE",
    ["Rv"] = "VIRT REPLACE",
    ["Rvc"] = "VIRT REPLACE",
    ["Rvx"] = "VIRT REPLACE",
    ["c"] = "COMMAND",
    ["cv"] = "VIM EX",
    ["ce"] = "EX",
    ["r"] = "PROMPT",
    ["rm"] = "MORE",
    ["r?"] = "CONFIRM",
    ["!"] = "SHELL",
    ["t"] = "TERMINAL",
  }

  local mode = mode_to_str[vim.api.nvim_get_mode().mode] or "UNKNOWN"

  local hl = "Other"
  if mode:find "NORMAL" then
    hl = "Normal"
  elseif mode:find "PENDING" then
    hl = "Pending"
  elseif mode:find "VISUAL" or mode:find "V-LINE" or mode:find "V-BLOCK" then
    hl = "Visual"
  elseif mode:find "INSERT" or mode:find "SELECT" then
    hl = "Insert"
  elseif mode:find "COMMAND" or mode:find "TERMINAL" or mode:find "EX" then
    hl = "Command"
  elseif mode:find "REPLACE" or mode:find "VIRT REPLACE" then
    hl = "Replace"
  end

  return string.format("%%#StatuslineMode%s#▊%s", hl, mode)
end

local git_component = function()
  local head = vim.b.gitsigns_head
  if not head or head == "" then return "" end
  if vim.api.nvim_win_get_width(0) < 80 then return "" end

  local status = vim.b.gitsigns_status_dict
  local added = status and status.added or 0
  local modified = status and status.changed or 0
  local removed = status and status.removed or 0

  local add_hl = added > 0 and string.format(" %%#StatuslineGitAdded#%s %d", icons.git_signs.added, added) or ""
  local change_hl = modified > 0
      and string.format(" %%#StatuslineGitModified#%s %d", icons.git_signs.modified, modified)
    or ""
  local delete_hl = removed > 0 and string.format(" %%#StatuslineGitDeleted#%s %d", icons.git_signs.removed, removed)
    or ""

  return string.format("%%#StatuslineTitle# %s %s%s%s", head, add_hl, change_hl, delete_hl)
end

local dap_component = function()
  if not package.loaded["dap"] or require("dap").status() == "" then return nil end

  return string.format("%%#%s#%s  %s", "DapUIRestart", icons.misc.bug, require("dap").status())
end

local lsp_progress_component = function()
  if not _G.progress_status.client or not _G.progress_status.title then return "" end

  return table.concat {
    "%#StatuslineTitle#󱥸 ",
    string.format("%%#StatuslineTitle#%s  ", _G.progress_status.client),
    string.format("%%#StatuslineItalic#%s...", _G.progress_status.title),
  }
end

local diagnostics_component = function()
  -- Lazy uses diagnostic icons, but those aren't errors per se.
  if vim.bo.filetype == "lazy" then return "" end

  if vim.startswith(vim.api.nvim_get_mode().mode, "i") then return last_diagnostic_component end

  local counts = vim.iter(vim.diagnostic.get(0)):fold({
    ERROR = 0,
    WARN = 0,
    HINT = 0,
    INFO = 0,
  }, function(acc, diagnostic)
    local severity = vim.diagnostic.severity[diagnostic.severity]
    acc[severity] = acc[severity] + 1
    return acc
  end)

  local parts = vim
    .iter(counts)
    :map(function(severity, count)
      if count == 0 then return nil end

      local capitalized_severity = severity:sub(1, 1) .. severity:sub(2):lower()
      local hl = "Diagnostic" .. capitalized_severity
      return string.format("%%#%s#%s %d", hl, icons.diagnostics[capitalized_severity], count)
    end)
    :totable()

  last_diagnostic_component = table.concat(parts, " ")
  return last_diagnostic_component
end

local filetype_component = function()
  local devicons = package.loaded["nvim-web-devicons"] and require "nvim-web-devicons"
  local mini_icons = package.loaded["mini.icons"] and require "mini.icons"

  local special_icons = {
    gitrebase = { icons.misc.git, "Number" },
    gitbranch = { icons.misc.git, "Number" },
    git = { icons.misc.git, "Number" },
    fugitive = { icons.misc.git, "Number" },
    lazy = { icons.symbol_kinds.Module, "Special" },
    oil = { icons.symbol_kinds.Folder, "Directory" },
    qf = { icons.misc.search, "Conditional" },
  }

  local filetype = vim.bo.filetype
  if filetype == "" then filetype = vim.bo.buftype ~= "" and vim.bo.buftype or "[No Name]" end

  local icon, icon_hl = icons.symbol_kinds.File, "StatusLine"
  if special_icons[filetype] then
    icon, icon_hl = unpack(special_icons[filetype])
  elseif devicons then
    local buf_name = vim.api.nvim_buf_get_name(0)
    local name, ext = vim.fn.fnamemodify(buf_name, ":t"), vim.fn.fnamemodify(buf_name, ":e")

    icon, icon_hl = devicons.get_icon(name, ext)
    if not icon then
      icon, icon_hl = devicons.get_icon_by_filetype(filetype, { default = true })
    end
  elseif mini_icons then
    icon, icon_hl = mini_icons.get("file", vim.api.nvim_buf_get_name(0))
  end

  return string.format("%%#%s#%s %%#StatuslineTitle#%s", icon_hl, icon, filetype)
end

local encoding_component = function()
  local encoding = vim.opt.fileencoding:get()
  return encoding ~= "" and string.format("%%#StatuslineInactive# %s", encoding) or ""
end

local filesize_component = function()
  local function format_file_size(file)
    local size = vim.fn.getfsize(file)
    if size <= 0 then return "" end
    local sufixes = { "b", "k", "m", "g" }
    local i = 1
    while size > 1024 do
      size = size / 1024
      i = i + 1
    end
    return string.format("%.1f%s", size, sufixes[i])
  end

  local file = vim.fn.expand "%:p"
  if string.len(file) == 0 then return "" end
  local size = format_file_size(file)

  return string.format("%%#StatuslineInactive#%s", size)
end

local position_component = function()
  local line = vim.fn.line "."
  local line_count = vim.api.nvim_buf_line_count(0)
  local col = vim.fn.virtcol "."

  return table.concat {
    "%#StatuslineItalic#l: ",
    string.format("%%#StatuslineTitle#%d", line),
    string.format("%%#StatuslineItalic#/%d c: %d", line_count, col),
  }
end

M.render = function()
  local function concat_components(components)
    return vim.iter(components):skip(1):fold(
      components[1],
      function(acc, component) return #component > 0 and string.format("%s  %s", acc, component) or acc end
    )
  end

  return table.concat {
    concat_components {
      mode_component(),
      filesize_component(),
      git_component(),
      dap_component() or lsp_progress_component(),
    },
    "%=",
    diagnostics_component(),
    "%=",
    concat_components {
      filetype_component(),
      encoding_component(),
      position_component(),
    },
    " ",
  }
end

if vim.o.laststatus == 3 then
  vim.o.statusline = "%!v:lua.require'config.statusline'.render()"
else
  _G.augroup("my.statusline", {
    {
      event = { "WinEnter", "BufWinEnter" },
      desc = "Attach winbar",
      callback = function(args)
        if vim.bo[args.buf].filetype == "qf" then return end
        vim.wo.statusline = "%!v:lua.require'config.statusline'.render()"
      end,
    },
    {
      event = "WinLeave",
      callback = function(args)
        if vim.bo[args.buf].filetype == "qf" then return end
        vim.wo.statusline = "%#StatusLineNC#"
      end,
    },
  })
end

return M
