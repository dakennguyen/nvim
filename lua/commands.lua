-- AUTO RELOAD {{{
vim.cmd [[
augroup AutoReload
  autocmd!
  autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif
  autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
augroup END
]]
-- }}}

-- RAILS SCHEMA {{{
vim.cmd[[ command! So edit db/schema.rb ]]
vim.cmd[[ command! Ss split db/schema.rb ]]
vim.cmd[[ command! Sv vsplit db/schema.rb ]]
vim.cmd[[ command! St tabedit db/schema.rb ]]
-- }}}

-- RAILS CONFIG {{{
vim.cmd[[ command! Co edit config/application.yml ]]
vim.cmd[[ command! Cs split config/application.yml ]]
vim.cmd[[ command! Cv vsplit config/application.yml ]]
vim.cmd[[ command! Ct tabedit config/application.yml ]]
-- }}}
