return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>rn", ":LualineRenameTab " },
  },
  config = function()
    local lualine = require "lualine"
    local colors = require("themes").colors().lualine

    local conditions = {
      buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand "%:t") ~= 1
      end,
      hide_in_width = function()
        return vim.fn.winwidth(0) > 80
      end,
      check_git_workspace = function()
        local filepath = vim.fn.expand "%:p:h"
        local gitdir = vim.fn.finddir(".git", filepath .. ";")
        return gitdir and #gitdir > 0 and #gitdir < #filepath
      end,
    }

    local config = {
      options = {
        component_separators = "",
        section_separators = "",
        theme = {
          normal = { c = { fg = colors.default_fg, bg = colors.default_bg } },
          insert = { c = { fg = colors.insert, bg = colors.default_bg } },
          visual = { c = { fg = colors.visual, bg = colors.default_bg } },
          replace = { c = { fg = colors.replace, bg = colors.default_bg } },
          command = { c = { fg = colors.command, bg = colors.default_bg } },
          terminal = { c = { fg = colors.op, bg = colors.default_bg } },
          inactive = { c = { fg = colors.inactive, bg = colors.default_bg } },
        },
        disabled_filetypes = {},
      },
      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {
          {
            "tabs",
            max_length = vim.o.columns,
            mode = 2,
            tabs_color = {
              active = { fg = colors.default_fg },
              inactive = { fg = colors.light },
            },
          },
        },
      },
    }

    --#############################################
    -- Inactive sections
    --#############################################
    table.insert(config.inactive_sections.lualine_c, {
      function()
        return "▊INACTIVE"
      end,
      padding = { left = 0 },
    })
    table.insert(config.inactive_sections.lualine_x, {
      "filename",
      path = 1,
      color = { fg = colors.yellow },
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
      function()
        return "▊"
      end,
      padding = { left = 0 },
    }

    ins_left {
      "mode",
      padding = { left = 0 },
    }

    ins_left {
      function()
        local function format_file_size(file)
          local size = vim.fn.getfsize(file)
          if size <= 0 then
            return ""
          end
          local sufixes = { "b", "k", "m", "g" }
          local i = 1
          while size > 1024 do
            size = size / 1024
            i = i + 1
          end
          return string.format("%.1f%s", size, sufixes[i])
        end
        local file = vim.fn.expand "%:p"
        if string.len(file) == 0 then
          return ""
        end
        return format_file_size(file)
      end,
      color = { fg = colors.light },
      cond = conditions.buffer_not_empty,
    }

    ins_left {
      "branch",
      icon = "",
      cond = conditions.check_git_workspace,
    }

    ins_left {
      "diff",
      symbols = { added = " ", modified = "柳", removed = " " },
      diff_color = {
        added = { fg = colors.op },
        modified = { fg = colors.yellow },
        removed = { fg = colors.replace },
      },
      cond = conditions.hide_in_width,
    }

    ins_left {
      "progress",
      color = { fg = colors.light },
    }

    ins_left {
      "location",
      color = { fg = colors.strong, gui = "bold" },
    }

    -- MIDDLE
    ins_left {
      function()
        return "%="
      end,
    }

    -- ins_left {
    --   function()
    --     local icon = '  '
    --     local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    --     local clients = vim.lsp.get_active_clients()
    --     if next(clients) == nil then return '' end
    --     for _, client in ipairs(clients) do
    --       local filetypes = client.config.filetypes
    --       if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
    --         return icon .. client.name
    --       end
    --     end
    --     return ''
    --   end,
    --   color = {fg = colors.light, gui = 'bold'}
    -- }

    ins_left {
      "diagnostics",
      sources = { "nvim_diagnostic" },
      symbols = { error = " ", warn = " ", info = " ", hint = "" },
      diagnostics_color = {
        error = "DiagnosticError",
        warn = "DiagnosticWarn",
        info = "DiagnosticInfo",
        hint = "DiagnosticHint",
      },
    }

    -- RIGHT
    -- ins_right {
    --   'o:encoding',
    --   fmt = string.upper,
    --   cond = conditions.hide_in_width,
    --   color = {fg = colors.default_fg, gui = 'bold'}
    -- }

    ins_right {
      "filetype",
      colored = false,
      icons_enabled = true,
      color = { fg = colors.command, gui = "bold" },
    }

    ins_right {
      "fileformat",
      fmt = string.upper,
      icons_enabled = true,
      color = { fg = colors.default_fg, gui = "bold" },
    }

    ins_right {
      "filename",
      path = 1,
      -- cond = conditions.buffer_not_empty,
      color = { fg = colors.yellow },
    }

    --#############################################
    lualine.setup(config)

    vim.cmd("highlight StatusLine guibg=" .. colors.default_bg)
    vim.cmd("highlight StatusLineNC guibg=" .. colors.default_bg)
  end,
}
