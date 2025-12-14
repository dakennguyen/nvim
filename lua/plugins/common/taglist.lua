vim.keymap.set("n", "<leader>t", function()
  local function collect_lines()
    local raw = vim.fn.execute "silent! tags"
    local parsed = {}
    for line in raw:gmatch "[^\n]+" do
      local cleaned = line:gsub("\r$", "")
      if cleaned:match "%S" then parsed[#parsed + 1] = cleaned end
    end
    return parsed
  end

  local stack = vim.fn.gettagstack(0)
  if not stack or stack.length == 0 then
    vim.notify("Tag stack is empty", vim.log.levels.INFO, { title = "Taglist" })
    return
  end

  local lines = collect_lines()
  if vim.tbl_isempty(lines) then
    vim.notify("Could not read tag stack", vim.log.levels.ERROR, { title = "Taglist" })
    return
  end

  local list_buf = vim.api.nvim_create_buf(false, true)
  local width = math.floor(vim.o.columns)
  local height = math.max(3, math.floor(vim.o.lines * 0.3))
  local row = math.floor((vim.o.lines - height) / 1)
  local col = math.floor((vim.o.columns - width) / 2)
  local win = vim.api.nvim_open_win(list_buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    border = "single",
    title = ":tags",
  })
  vim.api.nvim_set_option_value("relativenumber", false, { win = win })
  vim.api.nvim_set_option_value("buftype", "nofile", { buf = list_buf })
  vim.api.nvim_set_option_value("bufhidden", "wipe", { buf = list_buf })
  vim.api.nvim_set_option_value("swapfile", false, { buf = list_buf })

  local function render()
    vim.api.nvim_set_option_value("modifiable", true, { buf = list_buf })
    vim.api.nvim_buf_set_lines(list_buf, 0, -1, false, lines)
    vim.api.nvim_set_option_value("modifiable", false, { buf = list_buf })
  end

  render()

  local function refresh()
    lines = collect_lines()
    render()
  end

  vim.keymap.set("n", "r", refresh, { buffer = list_buf, desc = "Refresh tag list" })
  vim.keymap.set(
    "n",
    "q",
    function() vim.api.nvim_buf_delete(list_buf, { force = true }) end,
    { buffer = list_buf, desc = "Close tag list" }
  )
  vim.keymap.set(
    "n",
    "<leader>t",
    function() vim.api.nvim_buf_delete(list_buf, { force = true }) end,
    { buffer = list_buf, desc = "Close tag list" }
  )
end, { desc = "Show tag list" })
