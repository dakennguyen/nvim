vim.keymap.set("n", "<leader>b", function()
  local function collect_entries()
    local raw = vim.fn.execute "silent! buffers"
    local last_used = {}
    for _, info in ipairs(vim.fn.getbufinfo { buflisted = 1 }) do
      last_used[info.bufnr] = info.lastused or 0
    end
    local parsed = {}
    for line in raw:gmatch "[^\n]+" do
      local cleaned = line:gsub("\r$", "")
      if cleaned:match "%S" then
        local bufnr = tonumber(cleaned:match "^%s*(%d+)")
        if bufnr then parsed[#parsed + 1] = { bufnr = bufnr, text = cleaned, lastused = last_used[bufnr] or 0 } end
      end
    end
    table.sort(parsed, function(a, b)
      if a.lastused == b.lastused then return a.bufnr < b.bufnr end
      return a.lastused > b.lastused
    end)
    return parsed
  end

  local entries = collect_entries()

  if vim.tbl_isempty(entries) then
    vim.notify("No listed buffers", vim.log.levels.INFO, { title = "Bufferlist" })
    return
  end

  local list_buf = vim.api.nvim_create_buf(false, true)
  local width = math.floor(vim.o.columns)
  local height = math.floor(vim.o.lines * 0.3)
  local row = math.floor((vim.o.lines - height) / 1)
  local col = math.floor((vim.o.columns - width) / 2)
  local win = vim.api.nvim_open_win(list_buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    border = "single",
    title = "buffers",
  })
  vim.api.nvim_set_option_value("relativenumber", false, { win = win })

  local function render_entries()
    local display_lines = {}
    for idx, entry in ipairs(entries) do
      display_lines[idx] = entry.text
    end
    vim.api.nvim_set_option_value("modifiable", true, { buf = list_buf })
    vim.api.nvim_buf_set_lines(list_buf, 0, -1, false, display_lines)
    vim.api.nvim_set_option_value("modifiable", false, { buf = list_buf })
  end

  render_entries()

  local current_buf = vim.api.nvim_get_current_buf()
  local current_idx
  for idx, entry in ipairs(entries) do
    if entry.bufnr == current_buf then
      current_idx = idx
      break
    end
  end
  if current_idx then vim.api.nvim_win_set_cursor(win, { current_idx, 0 }) end

  local function open_buffer_for_idx(idx, command)
    local target = entries[idx]
    if not target then
      vim.notify(("Entry %d no longer exists"):format(idx), vim.log.levels.WARN, { title = "Bufferlist" })
      return
    end
    if not vim.api.nvim_buf_is_valid(target.bufnr) then
      vim.notify(("Buffer %d is invalid"):format(target.bufnr), vim.log.levels.WARN, { title = "Bufferlist" })
      return
    end
    vim.api.nvim_buf_delete(list_buf, { force = true })
    if command then vim.cmd(command) end
    vim.cmd(("buffer %d"):format(target.bufnr))
  end

  local function open_buffer(command)
    local idx = vim.api.nvim_win_get_cursor(0)[1]
    open_buffer_for_idx(idx, command)
  end

  local function delete_buffer_at_idx(idx)
    local target = entries[idx]
    if not target then
      vim.notify(("Entry %d no longer exists"):format(idx), vim.log.levels.WARN, { title = "Bufferlist" })
      return
    end
    if not vim.api.nvim_buf_is_valid(target.bufnr) then
      vim.notify(("Buffer %d is invalid"):format(target.bufnr), vim.log.levels.WARN, { title = "Bufferlist" })
      entries = collect_entries()
    else
      local ok, err = pcall(vim.api.nvim_buf_delete, target.bufnr, {})
      if not ok then
        vim.notify(
          ("Failed to delete buffer %d: %s"):format(target.bufnr, err),
          vim.log.levels.ERROR,
          { title = "Bufferlist" }
        )
        return
      end
      entries = collect_entries()
    end
    render_entries()
    local new_idx = math.min(idx, #entries)
    vim.api.nvim_win_set_cursor(win, { new_idx, 0 })
  end

  local function delete_buffer()
    local idx = vim.api.nvim_win_get_cursor(0)[1]
    delete_buffer_at_idx(idx)
  end

  vim.keymap.set("n", "<CR>", open_buffer, { buffer = list_buf, desc = "Go to buffer" })
  vim.keymap.set(
    "n",
    "<C-s>",
    function() open_buffer "split" end,
    { buffer = list_buf, desc = "Open buffer in split" }
  )
  vim.keymap.set(
    "n",
    "<C-v>",
    function() open_buffer "vsplit" end,
    { buffer = list_buf, desc = "Open buffer in vsplit" }
  )
  vim.keymap.set(
    "n",
    "<C-t>",
    function() open_buffer "tab split" end,
    { buffer = list_buf, desc = "Open buffer in tab" }
  )
  vim.keymap.set("n", "<C-x>", delete_buffer, { buffer = list_buf, desc = "Delete buffer" })

  vim.keymap.set(
    "n",
    "q",
    function() vim.api.nvim_buf_delete(list_buf, { force = true }) end,
    { buffer = list_buf, desc = "Close buffer list" }
  )
  vim.keymap.set(
    "n",
    "<leader>b",
    function() vim.api.nvim_buf_delete(list_buf, { force = true }) end,
    { buffer = list_buf, desc = "Close buffer list" }
  )

  for i = 1, 9 do
    local idx = i
    vim.keymap.set("n", tostring(idx), function() open_buffer_for_idx(idx) end, {
      buffer = list_buf,
      desc = ("Go to buffer %d"):format(idx),
    })
  end
end, { desc = "Show buffer list" })
