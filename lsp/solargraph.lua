-- `gem install solargraph`
return {
  cmd = { "solargraph", "stdio" },
  root_markers = {
    "Gemfile",
  },
  filetypes = { "ruby" },
  settings = {
    solargraph = {
      diagnostics = true,
      useBundler = true,
      formatting = true,
      autoformat = true,
    },
  },
  init_options = { formatting = true },
}
