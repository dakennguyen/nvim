_G.__global_callbacks = __global_callbacks or {}

_G.global = {
  _store = __global_callbacks,
}

function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function buf_map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_buf_set_keymap(0, mode, lhs, rhs, options)
end

function open_file_command(cmd_char, files)
  local assign = function(file)
    if vim.fn.filereadable(file) == 1 then
      vim.cmd(string.format('command! %so edit %s', cmd_char, file))
      vim.cmd(string.format('command! %ss split %s', cmd_char, file))
      vim.cmd(string.format('command! %sv vsplit %s', cmd_char, file))
      vim.cmd(string.format('command! %st tabedit %s', cmd_char, file))

      return true
    end

    return false
  end

  if type(files) == 'string' then
    assign(files)
    return
  end

  for _, file in ipairs(files) do
    if assign(file) then return end
  end
end

function augroup(name, commands)
  vim.cmd('augroup ' .. name)
  vim.cmd('au!')
  if #commands > 0 then
    for _, c in ipairs(commands) do
      autocmd(c)
    end
  else
    autocmd(commands)
  end
  vim.cmd('augroup END')
end

function autocmd(c)
  local command = c.command
  if type(command) == 'function' then
    table.insert(global._store, command)
    local fn_id = #global._store
    command = string.format('lua global._store[%s](args)', fn_id)
  end
  local event = c.event
  if type(c.event) == 'table' then
    event = table.concat(c.event, ',')
  end

  local pattern = c.pattern or ''
  if type(c.pattern) == 'table' then
    pattern = table.concat(c.pattern, ',')
  end

  local once = ''
  if c.once == true then
    once = '++once '
  end
  local nested = ''
  if c.nested == true then
    nested = '++nested '
  end

  vim.cmd(string.format('autocmd %s %s %s %s %s', event, pattern, once, nested, command))
end

function highlight(group, colors)
  local style = colors.style and "gui=" .. colors.style or "gui=NONE"
  local fg = colors.fg and "guifg=" .. colors.fg or "guifg=NONE"
  local bg = colors.bg and "guibg=" .. colors.bg or "guibg=NONE"
  local sp = colors.sp and "guisp=" .. colors.sp or ""

  local hl = "highlight " .. group .. " " .. style .. " " .. fg .. " " .. bg .. " " .. sp

  vim.cmd(hl)
  if colors.link then
    vim.cmd("highlight! link " .. group .. " " .. colors.link)
  end
end
