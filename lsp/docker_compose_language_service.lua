-- npm install -g @microsoft/compose-language-service
return {
  cmd = { "docker-compose-langserver", "--stdio" },
  filetypes = { "yaml.docker-compose" },
}
