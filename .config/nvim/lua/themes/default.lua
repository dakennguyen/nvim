return {
  specs = {},
  colors = function()
    if vim.o.background == "light" then
      return {
        lualine = {
          default_fg = "#5E81AC",
          default_bg = "#E0E2EA",
          light = "#494b53",
          visual = "#E45649",
          insert = "#61afef",
          replace = "#e06c75",
          command = "#c678dd",
          op = "#98c379",
          yellow = "#d19a66",
          inactive = "#81879C",
          strong = "#000000",
        },
        gitsigns = nil,
      }
    else
      return {
        lualine = {
          default_fg = "#87C0D0",
          default_bg = "#14161B",
          light = "#BBC2CF",
          visual = "#D08770",
          insert = "#5E81AC",
          replace = "#BF616A",
          command = "#B48EAD",
          op = "#A3BE8C",
          yellow = "#EBCB8B",
          inactive = "#81879C",
          strong = "#FFFFFF",
        },
        gitsigns = nil,
      }
    end

  end,
}
