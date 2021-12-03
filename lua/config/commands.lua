-- LOAD LOCAL VIMRC {{{
local local_vimrc = vim.fn.getcwd() .. '/.nvimrc'
if vim.loop.fs_stat(local_vimrc) then
  vim.cmd('source ' .. local_vimrc)
end
-- }}}

augroup('AutoReload', {
  {
    event = 'FileChangedShellPost',
    pattern = '*',
    command = function()
      vim.cmd('echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None')
    end,
  },
  {
    event = 'FocusGained,BufEnter,CursorHold,CursorHoldI',
    pattern = '*',
    command = function()
      vim.cmd[[ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif ]]
    end,
  }
})

augroup('Cursorline', {
  {
    event = 'VimEnter,WinEnter,BufWinEnter',
    pattern = '*',
    command = function()
      local ft = vim.api.nvim_buf_get_option(0, 'filetype')
      if ft ~= '' and ft ~= 'dashboard' then
        vim.opt_local.cursorline = true
      end
    end,
  },
  {
    event = 'WinLeave',
    pattern = '*',
    command = function()
      vim.opt_local.cursorline = false
    end,
  }
})
