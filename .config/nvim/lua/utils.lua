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
  if vim.bo.filetype == "fugitiveblame" then
    vim.cmd "norm gq"
  elseif vim.bo.filetype == "qf" then
    vim.cmd "quit"
    vim.cmd.wincmd "p"
  elseif vim.fn.winnr "$" == 1 and vim.fn.tabpagenr "$" > 1 then
    if vim.fn.tabpagenr() > 1 and vim.fn.tabpagenr() < vim.fn.tabpagenr "$" then
      vim.cmd "tabclose | tabprev"
    else
      vim.cmd "quit"
    end
  else
    if not pcall(vim.cmd.close) then vim.notify("E444: Cannot close last window", vim.log.levels.ERROR) end
    pcall(vim.cmd.wincmd, "p")
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

return M
