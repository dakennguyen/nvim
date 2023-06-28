augroup("AutoReload", {
  {
    event = "FileChangedShellPost",
    pattern = "*",
    command = function()
      vim.cmd 'echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None'
    end,
  },
  {
    event = "FocusGained,BufEnter,CursorHold,CursorHoldI",
    pattern = "*",
    command = function()
      vim.cmd [[ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif ]]
    end,
  },
})

augroup("Cursorline", {
  {
    event = "VimEnter,WinEnter,BufWinEnter",
    pattern = "*",
    command = function()
      local ft = vim.api.nvim_buf_get_option(0, "filetype")
      if ft ~= "" and ft ~= "dashboard" then
        vim.opt_local.cursorline = true
      end
    end,
  },
  {
    event = "WinLeave",
    pattern = "*",
    command = function()
      vim.opt_local.cursorline = false
    end,
  },
})

augroup("Terminal", {
  event = "TermOpen",
  pattern = "term://*",
  command = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false

    vim.opt.bufhidden = "delete"
  end,
})

augroup("RemoveTrailingWhitespace", {
  event = "BufWritePre",
  pattern = "*",
  command = ":%s/\\s\\+$//e",
})

augroup("Nvr", {
  event = "FileType",
  pattern = "gitcommit,gitrebase,gitconfig",
  command = function()
    vim.opt.bufhidden = "delete"
  end,
})
