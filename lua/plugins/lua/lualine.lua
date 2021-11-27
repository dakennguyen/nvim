local lualine = require 'lualine'

local nord = {
  default_fg = "#87C0D0",
  default_bg = "#2E3440",
  light = "#BBC2CF",
  visual = "#D08770",
  insert = "#5E81AC",
  replace = "#BF616A",
  command = "#B48EAD",
  op = "#A3BE8C",
  yellow = "#EBCB8B",
  inactive = "#81879C",
  white = "#FFFFFF"
}

local conditions = {
  buffer_not_empty = function() return vim.fn.empty(vim.fn.expand('%:t')) ~= 1 end,
  hide_in_width = function() return vim.fn.winwidth(0) > 80 end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end
}

local config = {
  options = {
    component_separators = "",
    section_separators = "",
    theme = {
      normal = {c = {fg = nord.default_fg, bg = nord.default_bg}},
      insert = {c = {fg = nord.insert, bg = nord.default_bg}},
      visual = {c = {fg = nord.visual, bg = nord.default_bg}},
      replace = {c = {fg = nord.replace, bg = nord.default_bg}},
      command = {c = {fg = nord.command, bg = nord.default_bg}},
      terminal = {c = {fg = nord.op, bg = nord.default_bg}},
      inactive = {c = {fg = nord.inactive, bg = nord.default_bg}}
    },
    disabled_filetypes = {},
  },
  sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  }
}

--#############################################
-- Inactive sections
--#############################################
table.insert(config.inactive_sections.lualine_c, {
  function() return '▊INACTIVE' end,
  padding = { left = 0 }
})
table.insert(config.inactive_sections.lualine_x, {
  'filename',
  color = { gui = 'italic' }
})

--#############################################
-- Active sections
--#############################################

local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

-- LEFT
ins_left {
  function() return '▊' end,
  padding = { left = 0 }
}

ins_left {
  'mode',
  padding = { left = 0 }
}

ins_left {
  function()
    local function format_file_size(file)
      local size = vim.fn.getfsize(file)
      if size <= 0 then return '' end
      local sufixes = {'b', 'k', 'm', 'g'}
      local i = 1
      while size > 1024 do
        size = size / 1024
        i = i + 1
      end
      return string.format('%.1f%s', size, sufixes[i])
    end
    local file = vim.fn.expand('%:p')
    if string.len(file) == 0 then return '' end
    return format_file_size(file)
  end,
  color = {fg = nord.light},
  cond = conditions.buffer_not_empty
}

ins_left {
  'branch',
  icon = '',
  cond = conditions.check_git_workspace,
}

ins_left {
  'diff',
  symbols = {added = ' ', modified = '柳', removed = ' '},
  diff_color = {
    added = { fg = nord.op },
    modified = { fg = nord.yellow },
    removed = { fg = nord.replace },
  },
  cond = conditions.hide_in_width,
}

ins_left {
  'progress',
  color = {fg = nord.light},
}

ins_left {
  'location',
  color = {fg = nord.white, gui = 'bold'}
}

-- MIDDLE
ins_left {function() return '%=' end}

ins_left {
  function()
    local icon = '  '
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then return '' end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return icon .. client.name
      end
    end
    return ''
  end,
  color = {fg = nord.light, gui = 'bold'}
}

ins_left {
  'diagnostics',
  sources = {'nvim_lsp'},
  symbols = {error = ' ', warn = ' ', info = ' ', hint = ''},
  diagnostics_color = {
    error = 'LspDiagnosticsDefaultError',
    warn  = 'LspDiagnosticsDefaultWarning',
    info  = 'LspDiagnosticsDefaultInformation',
    hint  = 'LspDiagnosticsDefaultHint',
  },
}

-- RIGHT
ins_right {
  'o:encoding',
  fmt = string.upper,
  cond = conditions.hide_in_width,
  color = {fg = nord.default_fg, gui = 'bold'}
}

ins_right {
  'filetype',
  colored = false,
  icons_enabled = true,
  color = { fg = nord.command, gui = 'bold' }
}

ins_right {
  'fileformat',
  fmt = string.upper,
  icons_enabled = true,
  color = {fg = nord.default_fg, gui = 'bold'}
}

ins_right {
  'filename',
  cond = conditions.buffer_not_empty,
  color = { fg = nord.yellow, gui = 'italic' }
}

--#############################################
lualine.setup(config)

vim.cmd("highlight StatusLine guibg=" .. nord.default_bg)
vim.cmd("highlight StatusLineNC guibg=" .. nord.default_bg)
