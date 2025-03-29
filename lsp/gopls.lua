-- go install golang.org/x/tools/gopls@latest
return {
  cmd = { "gopls" },
  root_markers = { "go.work", "go.mod" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
}
