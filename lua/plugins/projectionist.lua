return {
  "tpope/vim-projectionist",
  lazy = false, -- NOTE: cannot lazy loading for `drs` command
  keys = {
    { "<space>6", "<cmd>A<CR>" },
    { "c<cr>", "<cmd>Console<CR>" },
    { "c<space>", ":Console " },
  },
  config = function()
    vim.g.projectionist_heuristics = {
      [".git/"] = {
        ["local.http"] = { type = "http" },
        ["docs/*.md"] = { type = "doc" },
        ["README.md"] = { type = "readme" },
        [".projections.json"] = { type = "project" },
        ["Gemfile"] = { alternate = "Gemfile.lock", type = "gem" },
        ["Gemfile.lock"] = { alternate = "Gemfile" },
        ["composer.json"] = { alternate = "composer.lock", type = "composer" },
        ["composer.lock"] = { alternate = "composer.json" },
        ["package.json"] = { alternate = "package-lock.json", type = "package" },
        ["package-lock.json"] = { alternate = "package.json" },
      },
    }
  end,
}
