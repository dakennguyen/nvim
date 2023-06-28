return {
  "kevinhwang91/nvim-bqf",
  init = lazy_load "nvim-bqf",
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
