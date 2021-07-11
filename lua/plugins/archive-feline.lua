local lsp = require('feline.providers.lsp')
local vi_mode_utils = require('feline.providers.vi_mode')

local properties = {
  force_inactive = {
    filetypes = {},
    buftypes = {},
    bufnames = {}
  }
}

local components = {
  left = {active = {}, inactive = {}},
  mid = {active = {}, inactive = {}},
  right = {active = {}, inactive = {}}
}

local colors = {
  bg = '#4c566a',
  -- black = '#4c566a',
  yellow = '#d8a657',
  cyan = '#89b482',
  -- oceanblue = '#45707a',
  orange = '#e78a4e',
  -- magenta = '#c14a4a',
  white = '#100E23',
  fg = '#100E23',
  nord_bg = '#4c566a',
  nord_fg = '#100E23',
  nord_fg_white = '#e5e9f0',
  nord_light_blue = '#91ddff',
  nord_light_yellow = '#c9d05c',
  nord_light_orange = '#d3b987',
  nord_light_red = '#f43753',
  nord_dark_blue = '#65b2ff',
  nord_dark_yellow = '#9faa00',
  nord_dark_orange = '#ffc24b',
  nord_dark_red = '#c5152f',
}

local vi_mode_colors = {
  NORMAL = 'nord_light_blue',
  OP = 'nord_light_blue',
  INSERT = 'nord_light_yellow',
  VISUAL = 'nord_light_orange',
  BLOCK = 'nord_light_orange',
  REPLACE = 'nord_light_red',
  ['V-REPLACE'] = 'nord_light_red',
  ENTER = 'cyan',
  MORE = 'cyan',
  SELECT = 'orange',
  COMMAND = 'nord_light_blue',
  SHELL = 'nord_light_blue',
  TERM = 'nord_light_blue',
  NONE = 'yellow'
}

local vi_mode_colors_2 = {
  NORMAL = 'nord_dark_blue',
  OP = 'nord_dark_blue',
  INSERT = 'nord_dark_yellow',
  VISUAL = 'nord_dark_orange',
  BLOCK = 'nord_dark_orange',
  REPLACE = 'nord_dark_red',
  ['V-REPLACE'] = 'nord_dark_red',
  ENTER = 'cyan',
  MORE = 'cyan',
  SELECT = 'orange',
  COMMAND = 'nord_dark_blue',
  SHELL = 'nord_dark_blue',
  TERM = 'nord_dark_blue',
  NONE = 'yellow'
}

local vi_mode_text = {
  NORMAL = ' <| ',
  OP = ' <| ',
  INSERT = ' |> ',
  VISUAL = ' <> ',
  BLOCK = ' <> ',
  REPLACE = ' <> ',
  ['V-REPLACE'] = ' <> ',
  ENTER = ' <> ',
  MORE = ' <> ',
  SELECT = ' <> ',
  COMMAND = ' <| ',
  SHELL = ' <| ',
  TERM = ' <| ',
  NONE = ' <> '
}

local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
    return true
  end
  return false
end

local checkwidth = function()
  local squeeze_width  = vim.fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

properties.force_inactive.filetypes = {
  'NvimTree',
  'dbui',
  'packer',
  'startify',
  'fugitive',
  'fugitiveblame'
}

properties.force_inactive.buftypes = {
  'terminal'
}

-- LEFT

local vi_mode_provider = function()
    local mode_alias = {
      n = 'NORMAL',
      no = 'NORMAL',
      i = 'INSERT',
      v = 'VISUAL',
      V = 'V-LINE',
      [''] = 'V-BLOCK',
      c = 'COMMAND',
      cv = 'COMMAND',
      ce = 'COMMAND',
      R = 'REPLACE',
      Rv = 'REPLACE',
      s = 'SELECT',
      S = 'SELECT',
      [''] = 'SELECT',
      t = 'TERMINAL',
    }
    return ' ' .. mode_alias[vim.fn.mode()] .. ' '
end

-- vi-mode
components.left.active[1] = {
  provider = vi_mode_provider,
  hl = function()
    local val = {}

    val.bg = vi_mode_utils.get_mode_color()
    val.fg = 'nord_fg'
    val.style = 'bold'

    return val
  end,
  right_sep = ''
}
-- vi-symbol
components.left.active[2] = {
  provider = function()
    return vi_mode_text[vi_mode_utils.get_vim_mode()]
  end,
  hl = function()
    local val = {}
    val.fg = 'nord_fg'
    val.bg = vi_mode_colors_2[vi_mode_utils.get_vim_mode()]
    val.style = 'bold'
    return val
  end,
  right_sep = ''
}
-- filename
components.left.active[3] = {
  provider = 'file_info',
  hl = function()
    local val = {}
    val.fg = 'nord_fg'
    val.bg = vi_mode_colors_2[vi_mode_utils.get_vim_mode()]
    val.style = 'bold'
    return val
  end,
  right_sep = ''
}
-- diagnosticErrors
components.left.active[4] = {
  provider = 'diagnostic_errors',
  enabled = function() return lsp.diagnostics_exist('Error') end,
  hl = {
    fg = 'nord_light_red',
    style = 'bold'
  }
}
-- diagnosticWarn
components.left.active[5] = {
  provider = 'diagnostic_warnings',
  enabled = function() return lsp.diagnostics_exist('Warning') end,
  hl = {
    fg = 'nord_light_orange',
    style = 'bold'
  }
}
-- diagnosticHint
components.left.active[6] = {
  provider = 'diagnostic_hints',
  enabled = function() return lsp.diagnostics_exist('Hint') end,
  hl = {
    fg = 'nord_light_yellow',
    style = 'bold'
  }
}
-- diagnosticInfo
components.left.active[7] = {
  provider = 'diagnostic_info',
  enabled = function() return lsp.diagnostics_exist('Information') end,
  hl = {
    fg = 'nord_light_blue',
    style = 'bold'
  }
}
-- gitBranch
-- components.left.active[4] = {
--   provider = 'git_branch',
--   hl = {
--     fg = 'yellow',
--     bg = 'bg',
--     style = 'bold'
--   }
-- }
-- diffAdd
-- components.left.active[4] = {
--   provider = 'git_diff_added',
--   hl = {
--     fg = 'nord_light_blue',
--     bg = 'bg',
--     style = 'bold'
--   }
-- }
-- diffModfified
-- components.left.active[5] = {
--   provider = 'git_diff_changed',
--   hl = {
--     fg = 'orange',
--     bg = 'bg',
--     style = 'bold'
--   }
-- }
-- diffRemove
-- components.left.active[6] = {
--   provider = 'git_diff_removed',
--   hl = {
--     fg = 'nord_light_yellow',
--     bg = 'bg',
--     style = 'bold'
--   }
-- }

-- MID

-- LspName
-- components.mid.active[1] = {
--   provider = 'lsp_client_names',
--   hl = {
--     fg = 'yellow',
--     bg = 'bg',
--     style = 'bold'
--   },
--   right_sep = ' '
-- }

-- RIGHT

-- fileIcon
components.right.active[1] = {
  provider = function()
    local filename = vim.fn.expand('%:t')
    local extension = vim.fn.expand('%:e')
    local icon  = require'nvim-web-devicons'.get_icon(filename, extension)
    if icon == nil then
      icon = ''
    end
    return icon
  end,
  hl = function()
    local val = {}
    local filename = vim.fn.expand('%:t')
    local extension = vim.fn.expand('%:e')
    local icon, name  = require'nvim-web-devicons'.get_icon(filename, extension)
    if icon ~= nil then
      val.fg = vim.fn.synIDattr(vim.fn.hlID(name), 'fg')
    else
      val.fg = 'white'
    end
    val.bg = 'bg'
    val.style = 'bold'
    return val
  end,
  right_sep = ' '
}
-- fileType
components.right.active[2] = {
  provider = 'file_type',
  hl = function()
    local val = {}
    local filename = vim.fn.expand('%:t')
    local extension = vim.fn.expand('%:e')
    local icon, name  = require'nvim-web-devicons'.get_icon(filename, extension)
    if icon ~= nil then
      val.fg = vim.fn.synIDattr(vim.fn.hlID(name), 'fg')
    else
      val.fg = 'white'
    end
    val.bg = 'bg'
    val.style = 'bold'
    return val
  end,
  right_sep = ' '
}
-- fileSize
-- components.right.active[3] = {
--   provider = 'file_size',
--   enabled = function() return vim.fn.getfsize(vim.fn.expand('%:t')) > 0 end,
--   hl = {
--     fg = 'nord_light_orange',
--     bg = 'bg',
--     style = 'bold'
--   },
--   right_sep = ' '
-- }
-- fileFormat
-- components.right.active[4] = {
--   provider = function() return '' .. vim.bo.fileformat:upper() .. '' end,
--   hl = {
--     fg = 'white',
--     bg = 'bg',
--     style = 'bold'
--   },
--   right_sep = ' '
-- }
-- fileEncode
-- components.right.active[5] = {
--   provider = 'file_encoding',
--   hl = {
--     fg = 'white',
--     bg = 'bg',
--     style = 'bold'
--   },
--   right_sep = ' '
-- }
-- rubyVersion
-- components.right.active[6] = {
--   provider = function()
--     return ' '..vim.fn['rvm#string']()
--   end,
--   hl = {
--     fg = 'nord_light_yellow',
--     bg = 'bg',
--     style = 'bold'
--   },
--   right_sep = ' '
-- }
-- lineInfo
components.right.active[3] = {
  provider = 'position',
  hl = {
    fg = 'white',
    bg = 'bg',
    style = 'bold'
  },
  right_sep = ' '
}
-- linePercent
components.right.active[4] = {
  provider = 'line_percentage',
  hl = {
    fg = 'white',
    bg = 'bg',
    style = 'bold'
  },
  right_sep = ' '
}
-- scrollBar
components.right.active[5] = {
  provider = 'scroll_bar',
  hl = {
    fg = 'yellow',
    bg = 'bg',
  },
}

-- INACTIVE

-- fileType
components.left.inactive[1] = {
  provider = 'file_info',
  hl = {
    fg = 'nord_fg_white',
    bg = 'nord_bg',
    style = 'bold'
  },
  left_sep = ''
}

require('feline').setup({
  colors = colors,
  default_bg = bg,
  default_fg = fg,
  vi_mode_colors = vi_mode_colors,
  components = components,
  properties = properties,
})
