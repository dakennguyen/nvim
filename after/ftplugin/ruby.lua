vim.cmd [[
  iabbrev <buffer> bb byebug<esc>
]]

buf_map("n", "<leader>rr", ':vsplit term://ruby <c-r>=expand("%")<CR><CR>')
