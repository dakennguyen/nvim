vim.pack.add { "https://tpope.io/vim/projectionist" }

vim.keymap.set("n", "<space>6", "<cmd>A<CR>")
vim.keymap.set("n", "c<cr>", "<cmd>Console<CR>")
vim.keymap.set("n", "c<space>", ":Console ")

vim.g.projectionist_heuristics = {
  [".git/"] = {
    ["local.http"] = { type = "http" },
    ["doc/*.md"] = { type = "doc" },
    ["docs/*.md"] = { type = "doc" },
    ["README.md"] = { type = "readme" },
    [".projections.json"] = {
      type = "project",
      template = {
        "{",
        '  "*": {',
        '    "make": "",',
        '    "dispatch": ""',
        "  }",
        "}",
      },
    },
    ["Gemfile"] = { alternate = "Gemfile.lock", type = "gem" },
    ["Gemfile.lock"] = { alternate = "Gemfile" },
    ["composer.json"] = { alternate = "composer.lock", type = "composer" },
    ["composer.lock"] = { alternate = "composer.json" },
    ["package.json"] = { alternate = "package-lock.json", type = "package" },
    ["package-lock.json"] = { alternate = "package.json" },
  },
}
