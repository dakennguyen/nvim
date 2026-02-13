vim.pack.add { "https://github.com/folke/flash.nvim" }

vim.keymap.set({ "n", "o", "x" }, "s", require("flash").jump)
vim.api.nvim_set_hl(0, "FlashLabel", { bold = true })

require("flash").setup {
  modes = {
    search = { enabled = false },
    char = {
      enabled = true,
      highlight = { backdrop = false, matches = false },
      multi_line = false,
    },
  },
}
