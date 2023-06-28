local M = {}

-- Does: Function to execute macro over a visual range
M.visual_macro = function()
  vim.cmd 'echo "@".getcmdline()'
  vim.cmd [[execute ":'<,'>normal @".nr2char(getchar())]]
end

-- Does:
--   For wrapped lines, does gj/gk
--   For large jumps, adds a spot on the jump list
-- https://github.com/tjdevries/config_manager/blob/b9490fe7eb47e2bf21e828474787d8b8e8ed5314/xdg_config/nvim/autoload/tj.vim#L161
M.jump = function(letter)
  local count = vim.api.nvim_eval "v:count"
  if count == 0 then
    vim.cmd(string.format([[call execute('normal! g%s')]], letter))
    return
  end

  if count > 5 then
    vim.cmd [[call execute("normal! m'")]]
  end

  vim.cmd(string.format([[call execute('normal! %s%s', )]], count, letter))
end

-- Does: close and focus on previous tab
M.tabclose = function()
  pcall(vim.cmd, 'call execute("-1tabmove")')
  if not pcall(vim.cmd, 'call execute("tabclose")') then
    vim.api.nvim_echo({ { "E784: Cannot close last tab page", "ErrorMsg" } }, true, {})
  end
end

-- Does: quit and focus on previous buffer
M.smart_quit = function()
  if vim.bo.filetype == "fugitiveblame" then
    vim.cmd "norm gq"
  elseif vim.bo.filetype == "qf" then
    vim.cmd "quit"
  elseif vim.fn.winnr "$" == 1 and vim.fn.tabpagenr "$" > 1 then
    if vim.fn.tabpagenr() > 1 and vim.fn.tabpagenr() < vim.fn.tabpagenr "$" then
      vim.cmd "tabclose | tabprev"
    else
      vim.cmd "quit"
    end
  else
    if not pcall(vim.cmd, "close") then
      vim.api.nvim_echo({ { "E444: Cannot close last window", "ErrorMsg" } }, true, {})
    end
    vim.cmd "wincmd p"
  end
end

M.vsplit = function(cmd)
  vim.cmd "wincmd v"
  vim.cmd(string.format([[call execute('normal! %s')]], cmd))
end

return M
