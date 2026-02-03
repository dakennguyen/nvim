-- npm install -g intelephense
return {
  cmd = { "intelephense", "--stdio" },
  root_markers = { "composer.json" },
  filetypes = { "php" },
  settings = {
    intelephense = {
      format = {
        enable = false,
      },
    },
  },
}
