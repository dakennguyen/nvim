return {
  "dakennguyen/kulala.nvim",
  ft = { "http", "rest" },
  keys = {
    { "<leader>rl", "<cmd>lua require('kulala').replay()<cr>", { silent = true } },
  },
  opts = {
    global_keymaps = false,
  },
}
