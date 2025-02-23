_G.augroup("AutoReload", {
  {
    event = "FileChangedShellPost",
    pattern = "*",
    command = function() vim.cmd 'echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None' end,
  },
  {
    event = "FocusGained,BufEnter,CursorHold,CursorHoldI",
    pattern = "*",
    command = function() vim.cmd [[ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif ]] end,
  },
})

_G.augroup("Terminal", {
  event = "TermOpen",
  pattern = "term://*",
  command = function()
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
  pattern = "gitcommit,gitrebase,gitconfig",
  command = function() vim.opt.bufhidden = "delete" end,
})

-- vim.on_key(function(char)
--   if vim.fn.mode() ~= "n" then return end
--
--   local new_hlsearch = vim.tbl_contains({ "<CR>", "n", "N", "*", "#", "?", "/" }, vim.fn.keytrans(char))
--   if vim.opt.hlsearch:get() == new_hlsearch then return end
--
--   vim.opt.hlsearch = new_hlsearch
-- end, vim.api.nvim_create_namespace "auto_hlsearch")
