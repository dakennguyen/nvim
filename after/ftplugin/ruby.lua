vim.cmd [[
  iabbrev <buffer> bb byebug<esc>
]]

vim.b["start"] = "irb"
vim.b["dispatch"] = "ruby %"
