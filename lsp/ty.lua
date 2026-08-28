-- uv tool install ty@latest
local allowed_capabilities = {
  foldingRangeProvider = true,
  positionEncoding = true,
  textDocumentSync = true,
}

return {
  cmd = { "ty", "server" },
  root_markers = { "ty.toml", "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" },
  filetypes = { "python" },
  on_init = function(client)
    for capability in pairs(client.server_capabilities) do
      if not allowed_capabilities[capability] then client.server_capabilities[capability] = nil end
    end
  end,
}
