-- uv tool install ty@latest
return {
  cmd = { "ty", "server" },
  root_markers = { "ty.toml", "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" },
  filetypes = { "python" },
}
