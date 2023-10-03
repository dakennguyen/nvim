return {
  { "tpope/vim-surround", init = _G.lazy_load "vim-surround" },
  { "tpope/vim-rhubarb", event = "VeryLazy" },
  { "tpope/vim-commentary", init = _G.lazy_load "vim-commentary" },
  { "tpope/vim-bundler", event = "BufWinEnter Gemfile*" },
  { "tpope/vim-repeat", init = _G.lazy_load "vim-repeat", branch = "no-feedkeys" },
  { "dakennguyen/vim-unimpaired", event = "VeryLazy" },
}
