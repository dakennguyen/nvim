local code_agent_buf = nil
local code_agent_win = nil

local function focus_terminal()
  if not code_agent_win or not vim.api.nvim_win_is_valid(code_agent_win) then return false end
  vim.api.nvim_set_current_win(code_agent_win)
  return true
end

local function show_terminal()
  if not code_agent_buf or not vim.api.nvim_buf_is_valid(code_agent_buf) then return false end
  vim.cmd "vert botright 100 split"
  code_agent_win = vim.api.nvim_get_current_win()
  vim.api.nvim_win_set_buf(code_agent_win, code_agent_buf)
  return true
end

local function create_terminal()
  vim.cmd "vert botright 100 new"
  code_agent_win = vim.api.nvim_get_current_win()
  vim.cmd "terminal $MYCODEAGENT"
  code_agent_buf = vim.api.nvim_get_current_buf()
end

local function toggle_code_agent()
  local _ = focus_terminal() or show_terminal() or create_terminal()
  vim.cmd "startinsert"
end

local function paste_range_code_agent()
  -- Get the current file path and line range
  local file_path = vim.fn.expand "%"
  local start_line = vim.fn.line "v"
  local end_line = vim.fn.line "."
  if start_line > end_line then
    start_line, end_line = end_line, start_line
  end

  -- Create the string to paste
  local pos = "@" .. file_path .. ":" .. start_line
  if start_line ~= end_line then pos = pos .. "-" .. end_line end

  local _ = focus_terminal() or show_terminal() or create_terminal()
  vim.cmd "startinsert"
  vim.api.nvim_put({ pos }, "c", true, true)
end

local function paste_file_code_agent()
  local file_path = vim.fn.expand "%"
  local pos = "@" .. file_path
  local _ = focus_terminal() or show_terminal() or create_terminal()
  vim.cmd "startinsert"
  vim.api.nvim_put({ pos }, "c", true, true)
end

map("n", "<m-l>", toggle_code_agent, { silent = true })
map("v", "<m-l>", paste_range_code_agent, { silent = true })
map("n", "<m-L>", paste_file_code_agent, { silent = true })
