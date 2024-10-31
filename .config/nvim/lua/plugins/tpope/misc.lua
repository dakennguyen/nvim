return {
  { "tpope/vim-surround", init = _G.lazy_load "vim-surround" },
  { "tpope/vim-bundler", event = "BufWinEnter Gemfile*" },
  { "tpope/vim-repeat", init = _G.lazy_load "vim-repeat" },
  { "dakennguyen/vim-unimpaired", init = _G.lazy_load "vim-unimpaired" },
}
