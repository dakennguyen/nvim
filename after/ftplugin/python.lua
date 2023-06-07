vim.cmd[[
  iabbrev <buffer> bb import pdb; pdb.set_trace()<esc>
]]

buf_map('n', '`<cr>', ':R !python <c-r>=expand("%")<CR><CR>')
