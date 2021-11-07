-- LOAD LOCAL VIMRC {{{
local local_vimrc = vim.fn.getcwd() .. '/.nvimrc'
if vim.loop.fs_stat(local_vimrc) then
  vim.cmd('source ' .. local_vimrc)
end
-- }}}

-- AUTO RELOAD {{{
vim.cmd [[
augroup AutoReload
  autocmd!
  autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif
  autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
augroup END
]]
-- }}}

-- OPEN FILE {{{
function open_file(cmd_char, file)
  vim.cmd(string.format('command! %so edit %s', cmd_char, file))
  vim.cmd(string.format('command! %ss split %s', cmd_char, file))
  vim.cmd(string.format('command! %sv vsplit %s', cmd_char, file))
  vim.cmd(string.format('command! %st tabedit %s', cmd_char, file))
end

open_file('S', 'db/schema.rb')           -- rails schema
open_file('C', 'config/application.yml') -- rails config
-- }}}
