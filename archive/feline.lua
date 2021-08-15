local vi_mode = require("feline.providers.vi_mode")
local lsp = require("feline.providers.lsp")

icons = {
  pencil = "",
  locker = "",
  git = "",
  connected = "",
  plus = "+",
  minus = "-",
  tilde = "~",
  hint = '' -- xf838
}

local function custom_position(component)
  local icon = component.icon
  return string.format("%s%4d:%-3d", icon, vim.fn.line("."), vim.fn.col("."))
end

local function git_modified(value)
  local gsd = vim.b.gitsigns_status_dict
  local val = {}

  if gsd and gsd[value] and gsd[value] > 0 then
    val.str = ' '
  else
    val.str = ''
  end

  return val
end

local function file_icon(component, filename, extension)
  return component.icon or require "nvim-web-devicons".get_icon(filename, extension, {default = true})
end

local function is_modified(component)
  if vim.bo.modified then
    return component.file_modified_icon or icons.pencil .. " "
  else
    return ""
  end
end

local function custom_file_info(component)
  local filename = vim.fn.expand("%:t")
  local extension = vim.fn.expand("%:e")
  if filename == "" then
    filename = "unnamed"
  end
  local icon = file_icon(component, filename, extension)
  local modified_str = is_modified(component)
  return " " .. icon .. " " .. filename .. " " .. modified_str
end

local function file_readonly(component)
  local icon = component.icon or icons.locker
  if vim.bo.readonly then
    return icon .. " "
  else
    return ""
  end
end

local function custom_file_type()
  local type = vim.bo.filetype
  if type == "" then
    return "no ft"
  else
    return type:upper()
  end
end

local function lsp_connected(component)
  if not vim.tbl_isempty(vim.lsp.buf_get_clients(0)) then
    return component.icon or icons.connected .. "  "
  else
    return ""
  end
end

require('feline.providers').add_provider('custom_position', custom_position)
require('feline.providers').add_provider('custom_file_info', custom_file_info)
require('feline.providers').add_provider('file_readonly', file_readonly)
require('feline.providers').add_provider('custom_file_type', custom_file_type)
require('feline.providers').add_provider('lsp_connected', lsp_connected)

local default_color = {
  green = "#A3BE8C",
  red = "#BF616A",
  yellow = "#EBCB8B",
  blue = "#81A1C1",
}

local nord = {
  default_fg = "#8FBCBB",
  default_bg = "#3a4252",
  colors = {
    bg1 = "#3b4252",
    bg2 = "#4c566a",
    dark = "#2e3440",
    light = "#d8dee9",
    normal = "#87c0d0",
    visual = "#a3be8c",
    insert = "#5E81AC",
    replace = "#bf616a",
    command = "#B48EAD",
    op = "#D08770",
  },
}

local vi_mode_provider = function()
  local mode_alias = {
    n = "NORMAL",
    no = "OP",
    nov = "OP",
    noV = "OP",
    ["no"] = "OP",
    niI = "NORMAL",
    niR = "NORMAL",
    niV = "NORMAL",
    v = "VISUAL",
    V = "VISUAL",
    [""] = "BLOCK",
    s = "SELECT",
    S = "SELECT",
    [""] = "BLOCK",
    i = "INSERT",
    ic = "INSERT",
    ix = "INSERT",
    R = "REPLACE",
    Rc = "REPLACE",
    Rv = "V-REPLACE",
    Rx = "REPLACE",
    c = "COMMAND",
    cv = "COMMAND",
    ce = "COMMAND",
    r = "ENTER",
    rm = "MORE",
    ["r?"] = "CONFIRM",
    ["!"] = "SHELL",
    t = "TERM",
    ["null"] = "NONE"
  }
  return ' ' .. mode_alias[vim.fn.mode()] .. ' '
end

local c = nord
local cc = nord.colors

local components = {
  left = {active = {}, inactive = {}},
  mid = {active = {}, inactive = {}},
  right = {active = {}, inactive = {}}
}

-- left active
-- =======================================
table.insert(components.left.active, {
  provider = vi_mode_provider,
  hl = function()
    local val = {}

    val.name = vi_mode.get_mode_highlight_name()
    val.bg = vi_mode.get_mode_color()
    val.fg = "dark"
    val.style = "bold"

    return val
  end,
  right_sep = ""
})

table.insert(components.left.active, {
  provider = 'custom_file_info',
  hl = {fg = "light", bg = "bg2", style = "bold"}
})

table.insert(components.left.active, {
  provider = 'git_diff_added',
  icon = icons.plus,
  hl = {fg = default_color.green, style = "bold"},
  left_sep = function() return git_modified('added') end
})

table.insert(components.left.active, {
  provider = 'git_diff_changed',
  icon = icons.tilde,
  hl = {fg = default_color.yellow, style = "bold"},
  left_sep = function() return git_modified('changed') end
})

table.insert(components.left.active, {
  provider = 'git_diff_removed',
  icon = icons.minus,
  hl = {fg = default_color.red, style = "bold"},
  left_sep = function() return git_modified('removed') end
})

table.insert(components.left.active, {
  provider = 'file_readonly',
  hl = {fg = default_color.red, bg = "bg2", style = "bold"},
  right_sep = ""
})

-- -- right active
-- -- =======================================
table.insert(components.right.active, {
  provider = 'diagnostic_errors',
  enabled = function() return lsp.diagnostics_exist('Error') end,
  hl = {fg = default_color.red}
})

table.insert(components.right.active, {
  provider = 'diagnostic_warnings',
  enabled = function() return lsp.diagnostics_exist('Warning') end,
  hl = {fg = default_color.yellow}
})

table.insert(components.right.active, {
  provider = 'diagnostic_hints',
  icon = ' ' .. icons.hint .. ' ',
  enabled = function() return lsp.diagnostics_exist('Hint') end,
  hl = {fg = default_color.blue}
})

table.insert(components.right.active, {
  provider = 'diagnostic_info',
  enabled = function() return lsp.diagnostics_exist('Information') end,
  hl = {fg = default_color.green}
})

table.insert(components.right.active, {
  provider = "git_branch",
  icon = icons.git .. ' ',
  hl = {fg = "light", style = "bold"},
  left_sep = {str = " ┃ ", hl = {fg = "light"}},
  right_sep = ' '
})

table.insert(components.right.active, {
  provider = "custom_file_type",
  hl = {style = "bold"},
  left_sep = {str = "┃ ", hl = {fg = "light"}},
  right_sep = " "
})

table.insert(components.right.active, {
  provider = "lsp_connected",
  hl = {style = "bold", fg = default_color.yellow}
})

table.insert(components.right.active, {
  provider = 'custom_position',
  hl = function()
    local val = {}

    val.bg = vi_mode.get_mode_color()
    val.fg = "dark"
    val.style = "bold"

    return val
  end,
  icon = "",
})

-- -- left inactive
-- -- =======================================
table.insert(components.left.inactive, {
  provider = 'custom_file_info',
  hl = {fg = "insert", style = "bold"}
})

-- right inactive
-- =======================================

properties = {
  force_inactive = {
    filetypes = {
      'packer',
      'dashboard',
      'dirvish',
      'fugitive',
      'fugitiveblame',
    },
    buftypes = {},
    bufnames = {}
  }
}

require("feline").setup({
  default_fg = c.default_fg,
  default_bg = c.default_bg,
  colors = {
    bg1 = cc.bg1,
    bg2 = cc.bg2,
    dark = cc.dark,
    light = cc.light,
    normal = cc.normal,
    visual = cc.visual,
    insert = cc.insert,
    replace = cc.replace,
    command = cc.command,
    op = cc.op
  },
  vi_mode_colors = {
    NORMAL = "normal",
    OP = "op",
    INSERT = "insert",
    VISUAL = "visual",
    BLOCK = "visual",
    REPLACE = "replace",
    ["V-REPLACE"] = "replace",
    ENTER = "op",
    MORE = "dark",
    SELECT = "light",
    COMMAND = "command",
    SHELL = "light",
    TERM = "op",
    NONE = "dark"
  },
  components = components,
  properties = properties
})
