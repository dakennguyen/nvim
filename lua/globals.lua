_G.__global_callbacks = {}
_G.global = {
  _store = {},
}
_G.progress_status = { client = nil, title = nil }
_G.dev_paths = vim.split(os.getenv "PROJECT_PATHS_STR" or "", ":", { trimempty = true })

-- example:
-- vim.keymap.set("n", "[e", repeatable("n", "<Plug>(MoveUp)", function()
--   vim.cmd("move -2")
-- end))
_G.repeatable = function(mode, lhs, rhs)
  vim.validate("mode", mode, { "string", "table" })
  vim.validate("lhs", lhs, "string")
  vim.validate("rhs", rhs, "function")
  if not vim.startswith(lhs, "<Plug>") then error("`lhs` should start with `<Plug>`, given: " .. lhs) end
  vim.keymap.set(mode, lhs, function()
    rhs()
    vim.fn["repeat#set"](vim.api.nvim_replace_termcodes(lhs, true, true, true))
  end)
  return lhs
end

_G.augroup = function(name, commands)
  local id = vim.api.nvim_create_augroup(name, { clear = true })

  local autocmd = function(c)
    local event = c.event
    c.group = id
    c.event = nil
    vim.api.nvim_create_autocmd(event, c)
  end

  if #commands <= 0 then
    autocmd(commands)
    return
  end

  for _, c in ipairs(commands) do
    autocmd(c)
  end
end
