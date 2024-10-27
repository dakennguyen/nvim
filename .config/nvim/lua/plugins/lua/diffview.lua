return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  keys = {
    { "<leader>gd", ":DiffviewFileHistory %<CR>", silent = true },
    { "<space>gd", ":DiffviewOpen origin/HEAD...HEAD --imply-local<CR>", silent = true },
    { mode = "v", "<leader>gt", ":DiffviewFileHistory<CR>", silent = true },
  },
  opts = {
    file_panel = {
      win_config = {
        width = 50,
      },
    },
  },
}
