return {
  "kevinhwang91/nvim-bqf",
  ft = "qf",
  dependencies = {
    "junegunn/fzf",
    dir = "~/.fzf",
    build = "./install --all",
  },
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
}
