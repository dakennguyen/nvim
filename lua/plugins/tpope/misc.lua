return {
  { "https://tpope.io/vim/surround.git", init = _G.lazy_load "surround" },
  { "https://tpope.io/vim/rhubarb.git", event = "VeryLazy" },
  { "https://tpope.io/vim/commentary.git", event = "VeryLazy" },
  { "https://tpope.io/vim/vinegar.git", lazy = false },
  { "https://tpope.io/vim/bundler.git", ft = "ruby" },
  { "https://tpope.io/vim/repeat.git", init = _G.lazy_load "repeat", branch = "no-feedkeys" },
  { "dakennguyen/vim-unimpaired", init = _G.lazy_load "vim-unimpaired" },
}
