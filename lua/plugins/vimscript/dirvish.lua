return {
  "dakennguyen/vim-dirvish-dovish",
  lazy = false,
  dependencies = {
    "justinmk/vim-dirvish",
    config = function()
      vim.g.dirvish_mode = [[:sort ,^\v(.*[\/])|\ze,]]
      vim.g.dirvish_relative_paths = 1
    end,
  },
}
