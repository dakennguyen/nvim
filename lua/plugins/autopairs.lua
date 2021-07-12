require('nvim-autopairs').setup{
  ignored_next_char = "[%w%:%.]"
}

require('nvim-autopairs.completion.compe').setup({
  map_cr = true,
  map_complete = true,
})
