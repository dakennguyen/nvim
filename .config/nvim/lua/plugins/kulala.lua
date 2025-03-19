return {
  "mistweaverco/kulala.nvim",
  ft = { "http", "rest" },
  keys = {
    { "<space>ro", "<cmd>lua require('kulala').open()<cr>", { silent = true } },
    { "<space>rl", "<cmd>lua require('kulala').replay()<cr>", { silent = true } },
  },
  opts = {
    global_keymaps = false,
    display_mode = "float",
    kulala_keymaps = {
      ["Show verbose"] = { "D", function() require("kulala.ui").show_verbose() end },
    },
  },
}
