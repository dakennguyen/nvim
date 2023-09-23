return {
  { "https://tpope.io/vim/surround.git", init = _G.lazy_load "surround" },
  { "https://tpope.io/vim/rhubarb.git", event = "VeryLazy" },
  { "https://tpope.io/vim/commentary.git", init = _G.lazy_load "commentary" },
  { "https://tpope.io/vim/bundler.git", event = "BufWinEnter Gemfile*" },
  { "https://tpope.io/vim/repeat.git", init = _G.lazy_load "repeat", branch = "no-feedkeys" },
  { "dakennguyen/vim-unimpaired", event = "VeryLazy" },
}
