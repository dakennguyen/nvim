vim.pack.add { { src = "https://github.com/mistweaverco/kulala.nvim", version = "v5.3.4" } }

vim.keymap.set("n", "<space>ro", require("kulala").open, { silent = true })
vim.keymap.set("n", "<space>rl", require("kulala").replay, { silent = true })

require("kulala").setup {
  global_keymaps = false,
  display_mode = "float",
  kulala_keymaps = {
    ["Show verbose"] = { "D", function() require("kulala.ui").show_verbose() end },
  },
}
