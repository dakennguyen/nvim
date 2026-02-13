local load_session = function()
  local session_file = "Session.vim"
  if vim.fn.filereadable(session_file) == 1 then
    vim.cmd("source " .. session_file)
  else
    vim.notify("No sessions", vim.log.levels.WARN)
  end
end

local delete_session = function()
  local ok, choice = pcall(vim.fn.confirm, "Delete Session.vim?", "&Yes\n&No", 2)
  if not ok or choice ~= 1 then return end

  local deleted = vim.fn.delete "Session.vim"
  if deleted == 0 then
    vim.notify("Session deleted", vim.log.levels.INFO)
  else
    vim.notify("No session to delete", vim.log.levels.WARN)
  end
end

vim.keymap.set("n", "<space>ss", ":mksession!<CR>")
vim.keymap.set("n", "<space>sq", ":mksession!<CR>:qa<CR>")
vim.keymap.set("n", "<space>sr", ":mksession! | restart<CR>")
vim.keymap.set("n", "<space>sl", load_session, { silent = true })
vim.keymap.set("n", "<space>sd", delete_session, { silent = true })
