vim.opt_local.wrap = true

local open = function(command)
  local file = vim.fn.expand "<cfile>"
  if file ~= "" then vim.cmd(command .. " " .. vim.fn.fnameescape(file)) end
end

buf_map("n", "<c-v>", "<c-w><cr><c-w>H", { silent = true })
buf_map("n", "<c-s>", function() open "split" end, { silent = true })
buf_map("n", "<c-t>", function() open "tab drop" end, { silent = true })
