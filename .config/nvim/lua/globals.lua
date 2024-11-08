_G.__global_callbacks = {}
_G.global = {
  _store = {},
}

local map = vim.keymap.set

local buf_map = function(mode, lhs, rhs, opts)
  local options = { buffer = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

local open_file_command = function(cmd_char, files)
  local assign = function(file)
    if vim.fn.filereadable(file) == 1 then
      vim.cmd(string.format("command! %so edit %s", cmd_char, file))
      vim.cmd(string.format("command! %ss split %s", cmd_char, file))
      vim.cmd(string.format("command! %sv vsplit %s", cmd_char, file))
      vim.cmd(string.format("command! %st tabedit %s", cmd_char, file))

      return true
    end

    return false
  end

  if type(files) == "string" then
    assign(files)
    return
  end

  for _, file in ipairs(files) do
    if assign(file) then
      return
    end
  end
end

local autocmd = function(c)
  local command = c.command
  if type(command) == "function" then
    table.insert(_G.global._store, command)
    local fn_id = #_G.global._store
    command = string.format("lua _G.global._store[%s](args)", fn_id)
  end
  local event = c.event
  if type(c.event) == "table" then
    event = table.concat(c.event, ",")
  end

  local pattern = c.pattern or ""
  if type(c.pattern) == "table" then
    pattern = table.concat(c.pattern, ",")
  end

  local once = ""
  if c.once == true then
    once = "++once "
  end
  local nested = ""
  if c.nested == true then
    nested = "++nested "
  end

  vim.cmd(string.format("autocmd %s %s %s %s %s", event, pattern, once, nested, command))
end

local augroup = function(name, commands)
  vim.cmd("augroup " .. name)
  vim.cmd "au!"
  if #commands > 0 then
    for _, c in ipairs(commands) do
      autocmd(c)
    end
  else
    autocmd(commands)
  end
  vim.cmd "augroup END"
end

local highlight = function(group, colors)
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

local lazy_load = function(plugin)
  vim.api.nvim_create_autocmd({ "BufRead", "BufWinEnter", "BufNewFile" }, {
    group = vim.api.nvim_create_augroup("BeLazyOnFileOpen" .. plugin, {}),
    callback = function()
      local file = vim.fn.expand "%"
      local condition = string.sub(file, 1, 8) ~= "fugitive" and file ~= "[lazy]" and file ~= ""

      if condition then
        vim.api.nvim_del_augroup_by_name("BeLazyOnFileOpen" .. plugin)

        -- dont defer for treesitter as it will show slow highlighting
        -- This deferring only happens only when we do "nvim filename"
        if plugin ~= "nvim-treesitter" then
          vim.schedule(function()
            require("lazy").load { plugins = plugin }

            if plugin == "nvim-lspconfig" then
              vim.cmd "silent! do FileType"
            end
          end, 0)
        else
          require("lazy").load { plugins = plugin }
        end
      end
    end,
  })
end

local fold_text = function()
  local line_count = vim.v.foldend - vim.v.foldstart + 1
  local title = vim.fn.getline(vim.v.foldstart):gsub("^%s+", "")
    .. " ... "
    .. vim.fn.getline(vim.v.foldend):gsub("^%s+", "")
  local indent_level = vim.fn.indent(vim.v.foldstart)
  local fillchar_count = vim.o.columns - string.len(title) - string.len(line_count .. " lines") - indent_level - 7

  return string.rep(" ", indent_level) .. "+ " .. title .. string.rep(" ", fillchar_count) .. line_count .. " lines"
end

_G.map = map
_G.buf_map = buf_map
_G.lazy_load = lazy_load
_G.open_file_command = open_file_command
_G.augroup = augroup
_G.highlight = highlight
_G.fold_text = fold_text
