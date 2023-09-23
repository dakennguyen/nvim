buf_map("n", ".", ": <c-r><c-a><s-left><left>")
buf_map("n", "cb<space>", ":Git branch  <c-r><c-a><s-left><left>")
buf_map("n", "co<space>", ":Git checkout  <c-r><c-a><s-left><left>")
buf_map("n", "A", ":Git checkout -b  <c-r><c-a><s-left><left>")
buf_map("n", "D", ":Git branch  <c-r><c-a><s-left><left>")
buf_map("n", "R", ":Git branch -m <c-r><c-a> ")
buf_map("n", "rb", ":Git rebase <c-r><c-a><cr>")
buf_map("n", "mf", ":Git merge <c-r><c-a><cr>")

local track_remote = function()
  local list = vim.fn.matchlist(vim.fn.expand('<cWORD>'),[[\v^([^/]+)%(/(\S*))%( \-\> (\S+))?$]])
  if not list[2] then
    print('Not a remote branch')
    return
  end
  vim.cmd('Git checkout -b ' .. list[3] .. ' --track ' .. list[2] .. ' --')
end

buf_map("n", "cot", track_remote)
