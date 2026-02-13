-- https://pastebin.com/c2XygzHx
vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd "$argadd %"
  vim.cmd "argdedupe"
end)

for i = 1, 9 do
  vim.keymap.set("n", ("<space>%d"):format(i), function()
    local argc = vim.fn.argc()
    if argc < i or argc == 0 then
      vim.notify(("Argument %d not found"):format(i), vim.log.levels.WARN, { title = "Arglist" })
      return
    end
    vim.cmd(("%dargument"):format(i))
  end, { desc = ("Go to arg %d"):format(i), silent = true })
end

vim.keymap.set("n", "<leader>.", function()
  -- Create arglist buf and win
  local argseditor = vim.api.nvim_create_buf(false, true)
  local file_count = vim.fn.argc()
  local width = math.floor(vim.o.columns * 0.6)
  local height = math.min(file_count + 4, math.floor(vim.o.lines * 0.8))
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)
  local argseditor_win = vim.api.nvim_open_win(argseditor, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    border = "rounded",
    title = "arglist",
  })
  vim.api.nvim_set_option_value("relativenumber", false, { win = argseditor_win })

  -- Put current arglist
  local arglist = vim.fn.argv(-1)
  local to_read = {}
  for idx, entry in ipairs(arglist) do
    to_read[idx] = vim.fn.fnamemodify(entry, ":.")
  end
  vim.api.nvim_buf_set_lines(argseditor, 0, -1, false, to_read)

  -- Keep cursor aligned with current argument, similar to :args output
  local current_idx = vim.fn.argidx()
  if current_idx < file_count then vim.api.nvim_win_set_cursor(argseditor_win, { current_idx + 1, 0 }) end

  -- Keymaps
  local function open_arg(command)
    local line = vim.api.nvim_win_get_cursor(0)[1]
    vim.api.nvim_buf_delete(argseditor, { force = true })
    if command then vim.cmd(command) end
    vim.cmd(("%dargument"):format(line))
  end

  vim.keymap.set("n", "<CR>", function() open_arg() end, { buffer = argseditor, desc = "Go to file under cursor" })
  vim.keymap.set("n", "<C-s>", function() open_arg "split" end, { buffer = argseditor, desc = "Open arg in split" })
  vim.keymap.set("n", "<C-v>", function() open_arg "vsplit" end, { buffer = argseditor, desc = "Open arg in vsplit" })
  vim.keymap.set("n", "<C-t>", function() open_arg "tab split" end, { buffer = argseditor, desc = "Open arg in tab" })

  for i = 1, 9 do
    local idx = i
    vim.keymap.set("n", tostring(idx), function()
      local argc = vim.fn.argc()
      if argc == 0 or argc < idx then
        vim.notify(("Argument %d not found"):format(idx), vim.log.levels.WARN, { title = "Arglist" })
        return
      end
      vim.api.nvim_buf_delete(argseditor, { force = true })
      vim.cmd(("%dargument"):format(idx))
    end, { buffer = argseditor, desc = ("Go to arg %d"):format(idx), silent = true })
  end

  vim.keymap.set("n", "<leader>s", function()
    local to_write = vim.api.nvim_buf_get_lines(argseditor, 0, -1, true)
    vim.cmd "%argd"
    vim.cmd.arga(table.concat(to_write, " "))
    vim.api.nvim_buf_delete(argseditor, { force = true })
  end, { buffer = argseditor, desc = "Update arglist" })

  vim.keymap.set(
    "n",
    "q",
    function() vim.api.nvim_buf_delete(argseditor, { force = true }) end,
    { buffer = argseditor, desc = "Close arglist editor" }
  )
end, { desc = "Show arglist" })
