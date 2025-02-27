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

_G.augroup("LargeFile", {
  event = "BufReadPre",
  callback = function()
    local file = vim.fn.expand "%:p"
    local ok, size = pcall(vim.fn.getfsize, file)
    if not ok or size > 1024 * 1024 then vim.opt.foldmethod = "indent" end
  end,
})

_G.augroup("Notifier", {
  event = "LspProgress",
  callback = function(ev)
    local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
    vim.notify(vim.lsp.status(), "info", {
      id = "lsp_progress",
      title = "LSP Progress",
      opts = function(notif)
        notif.icon = ev.data.params.value.kind == "end" and " "
          or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
      end,
    })
  end,
})
