local M = {}

function M.setup()
  vim.pack.add { "https://github.com/shaunsingh/nord.nvim" }

  vim.opt.background = "dark"
  vim.g.nord_italic = true
  require("nord").set()

  -- vim.api.nvim_set_hl(0, "Folded", { fg = "#4C566A", bg = "NONE", italic = true })
  -- vim.api.nvim_set_hl(0, "Search", { fg = "white", bg = "NONE", underline = true, bold = true })

  -- vim.api.nvim_set_hl(0, "DiffAdd", { fg = "NONE", bg = "#324125" })
  -- vim.api.nvim_set_hl(0, "DiffChange", { fg = "NONE", bg = "#334963" })
  -- vim.api.nvim_set_hl(0, "DiffDelete", { fg = "NONE", bg = "#BF616A" })
  -- vim.api.nvim_set_hl(0, "DiffText", { fg = "NONE", bg = "#446285" })

  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#EBCB8B" })
  vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = "#EBCB8B" })
  vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { fg = "#EBCB8B" })
  vim.api.nvim_set_hl(0, "DiagnosticFloatingWarn", { fg = "#EBCB8B" })
end

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
