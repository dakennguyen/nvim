return {
  { "tpope/vim-surround", init = _G.lazy_load "vim-surround" },
  { "tpope/vim-rhubarb", init = _G.lazy_load "vim-rhubarb" },
  { "tpope/vim-commentary", init = _G.lazy_load "vim-commentary" },
  { "tpope/vim-bundler", event = "BufWinEnter Gemfile*" },
  { "tpope/vim-repeat", init = _G.lazy_load "vim-repeat", branch = "no-feedkeys" },
  { "dakennguyen/vim-unimpaired", init = _G.lazy_load "vim-unimpaired" },
}
