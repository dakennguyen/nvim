function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function open_file_command(cmd_char, file)
  vim.cmd(string.format('command! %so edit %s', cmd_char, file))
  vim.cmd(string.format('command! %ss split %s', cmd_char, file))
  vim.cmd(string.format('command! %sv vsplit %s', cmd_char, file))
  vim.cmd(string.format('command! %st tabedit %s', cmd_char, file))
end
