-- AUTO RELOAD {{{
vim.cmd [[
augroup AutoReload
  autocmd!
  autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif
  autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
augroup END
]]
-- }}}

-- WIPE ALL REGISTERS {{{
vim.cmd [[command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor]]
-- }}}

vim.cmd[[ command! So edit db/schema.rb ]]
vim.cmd[[ command! Ss split db/schema.rb ]]
vim.cmd[[ command! Sv vsplit db/schema.rb ]]
vim.cmd[[ command! St tabedit db/schema.rb ]]
