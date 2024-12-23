local M = {}

M.specs = {
  "rmehri01/onenord.nvim",
  config = function()
    local onenord = require("onenord.colors").load()

    require("onenord").setup {
      borders = false,
      fade_nc = false,
      italics = {
        comments = false,
        strings = false,
        keywords = false,
        functions = false,
        variables = false,
      },
      custom_highlights = {
        Folded = { fg = onenord.light_gray, style = onenord.none },
        Identifier = { fg = onenord.blue, style = "italic" },
        QuickFixLine = { style = "italic" },
      },
      custom_colors = {
        light = {
          light = "#494b53",
          strong = "#000000",
          diff_add_bg = "#e6ffed",
          diff_remove_bg = "#ffeef0",
          diff_text_bg = "#BEC9D4",
        },
        dark = {
          light = "#BBC2CF",
          strong = "#FFFFFF",
        },
      },
    }
  end,
}

function M.colors()
  local onenord = require("onenord.colors").load()

  return {
    lualine = {
      default_fg = onenord.cyan,
      default_bg = onenord.bg,
      light = onenord.light,
      visual = onenord.orange,
      insert = onenord.dark_blue,
      replace = onenord.dark_red,
      command = onenord.light_purple,
      op = onenord.green,
      yellow = onenord.yellow,
      inactive = onenord.light_gray,
      strong = onenord.strong,
    },
    gitsigns = {
      add_fg = onenord.diff_add,
      add_bg = onenord.diff_add_bg,
      change_fg = onenord.diff_change,
      change_bg = onenord.diff_change_bg,
      delete_fg = onenord.diff_remove,
      delete_bg = onenord.diff_remove_bg,
    },
  }
end

return M
