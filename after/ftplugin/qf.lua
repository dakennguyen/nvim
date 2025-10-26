vim.opt_local.wrap = true

local open = function(command)
  local file = vim.fn.expand "<cfile>"
  if file ~= "" then vim.cmd(command .. " " .. vim.fn.fnameescape(file)) end
end

vim.keymap.set("n", "<c-v>", "<c-w><cr><c-w>H", { buffer = true, silent = true })
vim.keymap.set("n", "<c-s>", function() open "split" end, { buffer = true, silent = true })
vim.keymap.set("n", "<c-t>", function() open "tab drop" end, { buffer = true, silent = true })
