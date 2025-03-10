return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>rn", ":LualineRenameTab " },
  },
  opts = function()
    local icons = require "icons"
    local colors = require("themes").colors().lualine
    if not colors then
      local utils = require "utils"
      colors = {
        default_fg = utils.get_hl("Normal").fg,
        default_bg = utils.get_hl("Normal").bg,
        light = utils.get_hl("Pmenu").bg,
        visual = utils.get_hl("DiagnosticSignWarn").fg,
        insert = utils.get_hl("DiagnosticSignInfo").fg,
        replace = utils.get_hl("DiagnosticSignError").fg,
        command = utils.get_hl("Function").fg,
        op = utils.get_hl("DiagnosticSignHint").fg,
        yellow = utils.get_hl("DiagnosticWarn").fg,
        inactive = utils.get_hl("Comment").fg,
        strong = utils.get_hl("Title").fg,
      }
    end
    _G.highlight("StatusLine", { bg = colors.default_bg })
    _G.highlight("StatusLineNC", { bg = colors.default_bg })

    local conditions = {
      buffer_not_empty = function() return vim.fn.empty(vim.fn.expand "%:t") ~= 1 end,
      hide_in_width = function() return vim.fn.winwidth(0) > 80 end,
      more_than_one_tab = function() return vim.fn.tabpagenr "$" > 1 end,
      check_git_workspace = function()
        local filepath = vim.fn.expand "%:p:h"
        local gitdir = vim.fn.finddir(".git", filepath .. ";")
        return gitdir and #gitdir > 0 and #gitdir < #filepath
      end,
    }

    local tabline = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {
        {
          -- breadcrumb
          function()
            local prefix = ""
            local prefix_path = ""
            local special_dirs = {
              [icons.misc.project .. " "] = vim.env.HOME .. "/projects",
              [icons.misc.config .. " "] = vim.env.HOME .. "/.dotfiles",
              [icons.misc.home .. " "] = vim.env.HOME,
            }
            local cwd = vim.fn.getcwd()
            for dir_name, dir_path in pairs(special_dirs) do
              if vim.startswith(cwd, vim.fs.normalize(dir_path)) and #dir_path > #prefix_path then
                prefix, prefix_path = dir_name, dir_path
              end
            end
            cwd = cwd:gsub("^" .. prefix_path, prefix)

            local parts = vim.split(cwd, "/")
            local result = table.concat(parts, " ")
            return result
          end,
          color = { gui = "bold" },
        },
        {
          "branch",
          icon = icons.misc.git_branch,
          cond = conditions.check_git_workspace,
          color = { fg = colors.strong, gui = "bold" },
        },
      },
      lualine_x = {},
      lualine_y = {},
      lualine_z = {
        {
          "tabs",
          max_length = vim.o.columns,
          mode = 0,
          cond = conditions.more_than_one_tab,
        },
      },
    }
    local extensions = {
      "lazy",
      "fugitive",
      "nvim-dap-ui",
      "oil",
      "quickfix",
    }

    local bubble = {
      options = {
        component_separators = "|",
        section_separators = { left = "", right = "" },
        always_show_tabline = true,
        theme = {
          normal = {
            a = { fg = colors.default_bg, bg = colors.default_fg },
            b = { fg = colors.default_fg, bg = colors.light },
            c = { fg = colors.default_fg },
          },

          insert = { a = { fg = colors.light, bg = colors.insert } },
          visual = { a = { fg = colors.light, bg = colors.visual } },
          replace = { a = { fg = colors.light, bg = colors.replace } },
          command = { a = { fg = colors.light, bg = colors.command } },
          terminal = { a = { fg = colors.light, bg = colors.op } },

          inactive = {
            a = { fg = colors.default_fg, bg = colors.light },
            b = { fg = colors.default_fg, bg = colors.light },
            c = { fg = colors.default_fg },
          },
        },
        disabled_filetypes = {},
      },
      sections = {
        lualine_a = {
          { "mode", separator = { left = "" }, right_padding = 2 },
        },
        lualine_b = {
          "filename",
          {
            "branch",
            icon = icons.misc.git_branch,
            cond = conditions.check_git_workspace,
            colors = { bg = colors.default_bg },
          },
        },
        lualine_c = {
          {
            "diff",
            symbols = icons.git_signs,
            cond = conditions.hide_in_width,
          },
        },
        lualine_x = {
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = icons.diagnostics,
          },
          {
            "lsp_status",
            cond = function() return _G.lsp_progressing end,
          },
        },
        lualine_y = {
          { "filetype", colored = false, icons_enabled = true },
          { "progress" },
        },
        lualine_z = {
          { "location", icon = icons.misc.custom_default, separator = { right = "" }, left_padding = 2 },
        },
      },
      inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" },
      },
      tabline = tabline,
      extensions = extensions,
    }

    local evil = {
      options = {
        component_separators = "",
        section_separators = "",
        always_show_tabline = true,
        theme = {
          normal = {
            c = { fg = colors.default_fg, bg = colors.default_bg },
            z = { fg = colors.default_fg, bg = colors.default_bg },
          },
          insert = { c = { fg = colors.insert, bg = colors.default_bg } },
          visual = { c = { fg = colors.visual, bg = colors.default_bg } },
          replace = { c = { fg = colors.replace, bg = colors.default_bg } },
          command = { c = { fg = colors.command, bg = colors.default_bg } },
          terminal = { c = { fg = colors.op, bg = colors.default_bg } },
          inactive = {
            c = { fg = colors.inactive, bg = colors.default_bg },
            z = { fg = colors.light, bg = colors.default_bg },
          },
        },
        disabled_filetypes = {},
      },
      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          {
            function() return "▊" end,
            padding = { left = 0 },
          },
          {
            "mode",
            padding = { left = 0 },
            color = { gui = "bold" },
          },
          {
            function()
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
              return format_file_size(file)
            end,
            color = { fg = colors.light },
            cond = conditions.buffer_not_empty,
          },
          {
            "fileformat",
            fmt = string.upper,
            icons_enabled = true,
            color = { fg = colors.default_fg, gui = "bold" },
          },
          {
            "o:encoding",
            fmt = string.upper,
          },
          {
            "diff",
            symbols = icons.git_signs,
            diff_color = {
              added = { fg = colors.op },
              modified = { fg = colors.yellow },
              removed = { fg = colors.replace },
            },
            cond = conditions.hide_in_width,
          },
          {
            "progress",
            color = { fg = colors.light },
          },
          {
            "location",
            color = { fg = colors.strong, gui = "bold" },
          },
          -- MIDDLE
          {
            function() return "%=" end,
          },
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = icons.diagnostics,
          },
          {
            "lsp_status",
            cond = function() return _G.lsp_progressing end,
          },
        },
        lualine_x = {
          {
            "filetype",
            colored = false,
            icons_enabled = true,
            color = { fg = colors.command, gui = "bold" },
          },
          {
            "filename",
            path = 1,
            color = { gui = "bold" },
          },
        },
        lualine_y = {},
        lualine_z = {},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          {
            function() return "▊INACTIVE" end,
            padding = { left = 0 },
          },
        },
        lualine_x = {
          {
            "filename",
            path = 1,
          },
        },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = tabline,
      extensions = extensions,
    }

    if require("themes").lualine_theme == "bubble" then return bubble end
    if require("themes").lualine_theme == "evil" then return evil end

    return {
      options = {
        component_separators = "",
        section_separators = "",
      },
      tabline = tabline,
      extensions = extensions,
    }
  end,
}
