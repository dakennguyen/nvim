_G.augroup("RemoveTrailingWhitespace", {
  event = "BufWritePre",
  pattern = "*",
  command = ":%s/\\s\\+$//e",
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
        notif.icon = ev.data.params.value.kind == "end" and require("icons").misc.tick
          or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
      end,
    })
  end,
})

vim.filetype.add {
  extension = {
    ["http"] = "http",
  },
}
