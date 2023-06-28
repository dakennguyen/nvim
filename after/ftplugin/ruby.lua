vim.cmd [[
  iabbrev <buffer> bb byebug<esc>
]]

buf_map("n", "`<cr>", ':vsplit term://ruby <c-r>=expand("%")<CR><CR>')
