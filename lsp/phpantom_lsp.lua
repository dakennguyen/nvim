-- brew install phpantom-lsp
local allowed_capabilities = {
  codeActionProvider = true,
  codeLensProvider = true,
  declarationProvider = true,
  documentLinkProvider = true,
  foldingRangeProvider = true,
  implementationProvider = true,
  inlayHintProvider = true,
  renameProvider = true,
  selectionRangeProvider = true,
  textDocumentSync = true,
  typeDefinitionProvider = true,
  typeHierarchyProvider = true,
  positionEncoding = true,
}

return {
  cmd = { "phpantom_lsp" },
  root_markers = { "composer.json" },
  filetypes = { "php" },
  on_init = function(client)
    for capability in pairs(client.server_capabilities) do
      if not allowed_capabilities[capability] then client.server_capabilities[capability] = nil end
    end
  end,
}
