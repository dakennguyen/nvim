vim.cmd [[
  iabbrev <buffer> bb import pdb; pdb.set_trace()<esc>
]]

vim.b["start"] = "python"
vim.b["dispatch"] = "python %"
