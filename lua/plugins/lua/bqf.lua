return {
  "kevinhwang91/nvim-bqf",
  event = "BufWinEnter quickfix",
  opts = {
    preview = {
      auto_preview = false,
    },
    func_map = {
      tab = "<c-t>",
      split = "<c-s>",
      ptoggleitem = "",
    },
  },
  config = true,
}
