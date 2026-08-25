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
  on_init = function(client)
    client.server_capabilities.codeActionProvider = nil
    client.server_capabilities.codeLensProvider = nil
    client.server_capabilities.declarationProvider = nil
    client.server_capabilities.documentLinkProvider = nil
    client.server_capabilities.foldingRangeProvider = nil
    client.server_capabilities.implementationProvider = nil
    client.server_capabilities.inlayHintProvider = nil
    client.server_capabilities.renameProvider = nil
    client.server_capabilities.selectionRangeProvider = nil
    client.server_capabilities.typeDefinitionProvider = nil
    client.server_capabilities.typeHierarchyProvider = nil
  end,
}
