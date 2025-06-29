return {
  "echasnovski/mini.surround",
  init = _G.lazy_load "mini.surround",
  opts = {
    mappings = {
      add = "ys",
      delete = "ds",
      find = "",
      find_left = "",
      highlight = "",
      replace = "cs",
      update_n_lines = "",
      suffix_last = "",
      suffix_next = "",
    },
    search_method = "cover_or_next",
  },
  config = function(_, opts)
    require("mini.surround").setup(opts)

    vim.keymap.del("x", "ys")
    vim.keymap.set("x", "S", [[:<C-u>lua MiniSurround.add('visual')<CR>]], { silent = true })
    vim.keymap.set("n", "yss", "ys_", { remap = true })
  end,
}
