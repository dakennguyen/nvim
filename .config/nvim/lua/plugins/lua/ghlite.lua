return {
  "daliusd/ghlite.nvim",
  dependencies = "ibhagwan/fzf-lua",
  config = function()
    require("ghlite").setup {
      debug = false, -- if set to true debugging information is written to ~/.ghlite.log file
      view_split = "vsplit", -- set to empty string '' to open in active buffer
      diff_split = "vsplit", -- set to empty string '' to open in active buffer
      comment_split = "split", -- set to empty string '' to open in active buffer
      open_command = "open", -- open command to use, e.g. on Linux you might want to use xdg-open
    }
  end,
  keys = {
    { "<space>uo", ":GHLitePRCheckout<cr>", silent = true },
    { "<space>uv", ":GHLitePRView<cr>", silent = true },
    { "<space>uu", ":GHLitePRLoadComments<cr>", silent = true },
    { "<space>ud", ":GHLitePRDiff<cr>", silent = true },
    { "<space>ua", ":GHLitePRAddComment<cr>", silent = true },
    { "<space>ug", ":GHLitePROpenComment<cr>", silent = true },
  },
}
