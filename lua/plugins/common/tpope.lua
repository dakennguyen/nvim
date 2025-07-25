return {
  { "tpope/vim-rhubarb", event = "VeryLazy" },
  {
    "tpope/vim-bundler",
    event = "BufWinEnter Gemfile*",
    cmd = { "Bundle", "Bopen", "Bedit", "Bsplit", "Bvsplit", "Btabedit", "Bpedit" },
  },
  { "tpope/vim-repeat", init = _G.lazy_load "vim-repeat" },
  { "tpope/vim-sleuth", lazy = false },
  { "tpope/vim-rsi", event = { "InsertEnter", "CmdlineEnter" } },
  { "dakennguyen/vim-unimpaired", event = "VeryLazy" },
}
