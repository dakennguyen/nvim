-- npm install -g typescript typescript-language-server
return {
  cmd = { "typescript-language-server", "--stdio" },
  root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  init_options = {
    hostInfo = "neovim",
  },
}
