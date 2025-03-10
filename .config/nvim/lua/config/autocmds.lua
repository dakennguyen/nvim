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
  pattern = { "begin", "end" },
  callback = function(ev)
    if ev.data.params.value.kind == "begin" then
      _G.lsp_progressing = true
    elseif ev.data.params.value.kind == "end" then
      _G.lsp_progressing = false
      vim.notify(ev.data.params.value.title, "info", {
        id = "lsp_progress",
        title = "LSP Progress",
        icon = require("icons").misc.tick,
      })
    end
  end,
})

_G.augroup("t_obsession", {
  event = "VimEnter",
  pattern = "*",
  nested = true,
  callback = function()
    if
      vim.fn.argc() == 0
      and vim.v.this_session == ""
      and not vim.bo.modified
      and vim.fn.filereadable "Session.vim" == 1
    then
      vim.cmd "source Session.vim"
    end
  end,
})

vim.filetype.add {
  extension = {
    ["http"] = "http",
  },
}

vim.api.nvim_create_user_command("R", function(opts)
  local result = vim.api.nvim_exec2(opts.args, { output = true })
  local lines = vim.split(result.output, "\n")

  vim.cmd "vnew"
  local buf = vim.api.nvim_get_current_buf()
  vim.api.nvim_set_option_value("buftype", "nofile", { buf = buf })
  vim.api.nvim_set_option_value("bufhidden", "wipe", { buf = buf })
  vim.api.nvim_set_option_value("swapfile", false, { buf = buf })
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
end, { nargs = 1, complete = "command", bar = true, range = true })
