vim.pack.add { "https://github.com/mistweaverco/kulala.nvim" }

vim.keymap.set("n", "<space>ro", "<cmd>lua require('kulala').open()<cr>", { silent = true })
vim.keymap.set("n", "<space>rl", "<cmd>lua require('kulala').replay()<cr>", { silent = true })

require("kulala").setup {
  global_keymaps = false,
  display_mode = "float",
  kulala_keymaps = {
    ["Show verbose"] = { "D", function() require("kulala.ui").show_verbose() end },
  },
}
