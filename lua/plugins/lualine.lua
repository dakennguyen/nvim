--#############################################
-- Themes
--#############################################
local nord_colors = {
  light_blue  = '#88C0D0',
  cyan = "#A3BE8C",
  yellow = "#EBCB8B",
  red = "#bf616a",
  blue = "#5E81AC",
  purple = "#B48EAD",
  orange = "#D08770",
  nord1  = '#3B4252',
  nord3  = '#4C566A',
  nord5  = '#E5E9F0',
}

local nord_theme = {
  normal = {
    a = {fg = nord_colors.nord1, bg = nord_colors.light_blue, gui = 'bold'},
    b = {fg = nord_colors.light_blue, bg = nord_colors.nord3},
    c = {fg = nord_colors.nord5, bg = nord_colors.nord1}
  },
  insert = {
    a = {fg = nord_colors.nord1, bg = nord_colors.blue, gui = 'bold'},
    b = {fg = nord_colors.blue, bg = nord_colors.nord3, gui = 'bold'},
  },
  visual = {
    a = {fg = nord_colors.nord1, bg = nord_colors.orange, gui = 'bold'},
    b = {fg = nord_colors.orange, bg = nord_colors.nord3, gui = 'bold'},
  },
  replace = {
    a = {fg = nord_colors.nord1, bg = nord_colors.red, gui = 'bold'},
    b = {fg = nord_colors.red, bg = nord_colors.nord3, gui = 'bold'},
  },
  command = {
    a = {fg = nord_colors.nord1, bg = nord_colors.purple, gui = 'bold'},
    b = {fg = nord_colors.purple, bg = nord_colors.nord3, gui = 'bold'},
  },
  terminal = {
    a = {fg = nord_colors.nord1, bg = nord_colors.cyan, gui = 'bold'},
    b = {fg = nord_colors.cyan, bg = nord_colors.nord3, gui = 'bold'},
  },
  inactive = {
    a = {fg = nord_colors.nord1, bg = nord_colors.light_blue, gui = 'bold'},
    b = {fg = nord_colors.nord5, bg = nord_colors.nord1},
    c = {fg = nord_colors.blue, bg = nord_colors.nord1}
  }
}

local theme = nord_theme
local colors = nord_colors

-- local theme = 'tokyonight'
-- local colors = require("tokyonight.colors").setup({})

--#############################################
-- Config
--#############################################
local function filename()
  local f_name, f_extension = vim.fn.expand('%:t'), vim.fn.expand('%:e')
  if f_name == "" then
    f_name = "unnamed"
  end
  local icon = require'nvim-web-devicons'.get_icon(f_name, f_extension, { default = true })
  if vim.bo.modified then
    f_name = f_name .. '  '
  elseif vim.bo.modifiable == false or vim.bo.readonly == true then
    f_name = f_name .. '  '
  end

  return icon .. " " .. f_name
end

local function lspserver()
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
end

require('lualine').setup {
  options = {
    theme = theme,
    disabled_filetypes = {
      'packer',
      'dashboard',
      'dirvish',
      'fugitive',
      'fugitiveblame',
    },
  },
  sections = {
    lualine_b = { 'branch' },
    lualine_c = {
      filename,
      {
        'diff',
        symbols = {added = '+', modified = '~', removed = '-'},
        color_added = { fg = colors.cyan },
        color_modified = { fg = colors.yellow },
        color_removed = { fg = colors.red },
      },
    },
    lualine_x = {
      {
        'diagnostics',
        sources = {'nvim_lsp'},
        symbols = {error = ' ', warn = ' ', info = ' '},
        color_error = { fg = colors.red },
        color_warn = { fg = colors.yellow },
        color_info = { fg = colors.cyan },
      },
      lspserver,
    },
    lualine_y = {
      {
        'filetype',
        colored = false,
        icons_enabled = false,
      }
    },
  },
  inactive_sections = {
    lualine_c = { filename },
    lualine_x = {},
  },
}
