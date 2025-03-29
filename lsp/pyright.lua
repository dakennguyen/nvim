-- pip install pyright
return {
  cmd = { "pyright-langserver", "--stdio" },
  root_dir = {
    "pyproject.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    "Pipfile",
    "pyrightconfig.json",
  },
  filetypes = { "python" },
}
