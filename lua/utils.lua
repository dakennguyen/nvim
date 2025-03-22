local M = {}

-- Does:
--   For wrapped lines, does gj/gk
--   For large jumps, adds a spot on the jump list
-- luacheck: ignore 631
-- https://github.com/tjdevries/config_manager/blob/b9490fe7eb47e2bf21e828474787d8b8e8ed5314/xdg_config/nvim/autoload/tj.vim#L161
M.jump = function(letter)
  local count = vim.api.nvim_eval "v:count"
  if count == 0 then
    vim.cmd(string.format([[call execute('normal! g%s')]], letter))
    return
  end

  if count > 5 then vim.cmd [[call execute("normal! m'")]] end

  vim.cmd(string.format([[call execute('normal! %s%s', )]], count, letter))
end

-- Does: close and focus on previous tab
M.tabclose = function()
  pcall(vim.cmd.call, 'execute("-1tabmove")')
  if not pcall(vim.cmd.call, 'execute("tabclose")') and vim.bo.filetype ~= "qf" then
    vim.notify("E784: Cannot close last tab page", vim.log.levels.ERROR)
  end
end

-- Does: quit and focus on previous buffer
M.smart_quit = function()
  for _, win in pairs(vim.api.nvim_list_wins()) do
    local win_config = vim.api.nvim_win_get_config(win)
    if win_config.relative ~= "" and not win_config.title then
      vim.api.nvim_win_close(win, true)
      return
    end
  end

  if vim.bo.filetype == "fugitiveblame" then
    vim.cmd "norm gq"
  elseif vim.fn.winnr "$" == 1 and vim.fn.tabpagenr "$" == 1 then
    vim.cmd "bd"
  elseif vim.fn.winnr "$" == 1 and vim.fn.tabpagenr "$" > 1 then
    if vim.fn.tabpagenr() > 1 and vim.fn.tabpagenr() < vim.fn.tabpagenr "$" then
      vim.cmd "tabclose | tabprev"
    else
      vim.cmd "quit"
    end
  elseif vim.bo.buftype == "nofile" then
    vim.cmd "q"
  else
    vim.cmd "q"
    vim.cmd.wincmd "p"
  end
end

M.vsplit = function(cmd)
  vim.cmd "wincmd v"
  vim.cmd(string.format([[call execute('normal! %s')]], cmd))
end

M.get_hl = function(group)
  local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
  return {
    fg = hl.fg and string.format("#%06x", hl.fg),
    bg = hl.bg and string.format("#%06x", hl.bg),
  }
end

M.load_session = function()
  local session_file = "Session.vim"
  if vim.fn.filereadable(session_file) == 1 then
    vim.cmd("source " .. session_file)
  else
    vim.notify("No sessions", vim.log.levels.WARN)
  end
end

M.eval_expression = function(expr)
  local mode = vim.api.nvim_get_mode()
  if mode.mode == "v" then
    -- [bufnum, lnum, col, off]; 1-indexed
    local start = vim.fn.getpos "v"
    local end_ = vim.fn.getpos "."

    local start_row = start[2]
    local start_col = start[3]

    local end_row = end_[2]
    local end_col = end_[3]

    if start_row == end_row and end_col < start_col then
      end_col, start_col = start_col, end_col
    elseif end_row < start_row then
      start_row, end_row = end_row, start_row
      start_col, end_col = end_col, start_col
    end

    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<ESC>", true, false, true), "n", false)

    -- buf_get_text is 0-indexed; end-col is exclusive
    local lines = vim.api.nvim_buf_get_text(0, start_row - 1, start_col - 1, end_row - 1, end_col, {})
    return table.concat(lines, "\n")
  end
  expr = expr or "<cexpr>"
  if type(expr) == "function" then
    return expr()
  else
    return vim.fn.expand(expr)
  end
end

M.toggle_quickfix = function()
  if vim.fn.getqflist({ winid = 0 }).winid ~= 0 then
    if vim.bo.filetype == "qf" then
      vim.cmd "cclose"
      vim.cmd.wincmd "p"
    else
      vim.cmd "botright copen"
    end
  else
    vim.cmd "botright copen"
  end
end

M.toggle_loclist = function(opts)
  local loclist = vim.fn.getloclist(0)
  local is_open = vim.fn.getloclist(0, { winid = 0 }).winid ~= 0

  if is_open then
    if vim.bo.filetype == "qf" then
      vim.cmd "lclose"
      vim.cmd.wincmd "p"
    else
      vim.cmd "lopen"
    end
  elseif opts and opts.setloclist then
    vim.diagnostic.setloclist()
  elseif #loclist > 0 then
    vim.cmd "lopen"
  else
    vim.notify("E776: No location list", vim.log.levels.ERROR)
  end
end

return M
