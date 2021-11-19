function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function open_file_command(cmd_char, file)
  vim.cmd(string.format('command! E%s edit %s', cmd_char, file))
  vim.cmd(string.format('command! S%s split %s', cmd_char, file))
  vim.cmd(string.format('command! V%s vsplit %s', cmd_char, file))
  vim.cmd(string.format('command! T%s tabedit %s', cmd_char, file))
end
