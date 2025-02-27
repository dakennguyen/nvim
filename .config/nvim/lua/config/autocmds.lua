_G.augroup("AutoReload", {
  {
    event = "FileChangedShellPost",
    pattern = "*",
    callback = function() vim.cmd 'echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None' end,
  },
  {
    event = { "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" },
    pattern = "*",
    callback = function() vim.cmd [[ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif ]] end,
  },
})

_G.augroup("Terminal", {
  event = "TermOpen",
  pattern = "term://*",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end,
})

_G.augroup("RemoveTrailingWhitespace", {
  event = "BufWritePre",
  pattern = "*",
  command = ":%s/\\s\\+$//e",
})

_G.augroup("Nvr", {
  event = "FileType",
  pattern = { "gitcommit", "gitrebase", "gitconfig" },
  callback = function() vim.opt.bufhidden = "delete" end,
})
