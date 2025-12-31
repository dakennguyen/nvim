vim.opt_local.wrap = false

vim.keymap.set("n", "<c-v>", "<c-w><cr><c-w>H", { buffer = true, silent = true })
vim.keymap.set("n", "<c-s>", "<c-w><cr>", { buffer = true, silent = true })
vim.keymap.set("n", "<c-t>", "<c-w><cr><c-w>T", { buffer = true, silent = true })

vim.keymap.set("n", "`<cr>", function()
  local info = vim.fn.getqflist { title = 1 }
  local title = info.title or ""
  local grepprg = vim.o.grepprg or ""
  if grepprg ~= "" and vim.startswith(title, ":" .. grepprg) then
    local offset = #(":" .. grepprg) + 1
    title = ":copen | silent grep!" .. title:sub(offset)
  end
  if title ~= "" then vim.cmd(title) end
end, { buffer = true })
