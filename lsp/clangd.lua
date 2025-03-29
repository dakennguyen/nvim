-- https://clangd.llvm.org/installation
return {
  cmd = {
    "clangd",
    "--clang-tidy",
    "--background-index",
    "--offset-encoding=utf-8",
  },
  root_markers = { ".clangd", "compile_commands.json" },
  filetypes = { "c", "cpp" },
}
