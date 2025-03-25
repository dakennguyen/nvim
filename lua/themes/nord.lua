local M = {}

M.specs = {
  "shaunsingh/nord.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.opt.background = "dark"
    vim.g.nord_italic = true
    require("nord").set()

    -- _G.highlight("Folded", { fg = "#4C566A", bg = "NONE", style = "italic" })
    -- _G.highlight("Search", { fg = "white", bg = "NONE", style = "underline,bold" })

    -- _G.highlight("DiffAdd", { fg = "NONE", bg = "#324125", style = "NONE" })
    -- _G.highlight("DiffChange", { fg = "NONE", bg = "#334963", style = "NONE" })
    -- _G.highlight("DiffDelete", { fg = "NONE", bg = "#BF616A", style = "NONE" })
    -- _G.highlight("DiffText", { fg = "NONE", bg = "#446285", style = "NONE" })

    _G.highlight("DiagnosticWarn", { fg = "#EBCB8B" })
    _G.highlight("DiagnosticVirtualTextWarn", { fg = "#EBCB8B" })
    _G.highlight("DiagnosticSignWarn", { fg = "#EBCB8B" })
    _G.highlight("DiagnosticFloatingWarn", { fg = "#EBCB8B" })
  end,
}

function M.colors()
  return {
    gitsigns = {
      add_bg = "#324125",
      change_bg = "#334963",
      delete_bg = "#BF616A",
    },
  }
end

return M
