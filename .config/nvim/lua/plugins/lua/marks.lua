return {
  "chentoast/marks.nvim",
  event = "VeryLazy",
  keys = {
    { "<space>mb", ":BookmarksQFListAll<CR>", silent = true },
  },
  opts = {
    refresh_interval = 250,
    bookmark_0 = {
      sign = "⚑",
      virt_text = "",
      annotate = false,
    },
  },
  config = true,
}
