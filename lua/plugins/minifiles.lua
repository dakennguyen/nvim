vim.pack.add { "https://github.com/nvim-mini/mini.files" }

-- luacheck: globals MiniFiles
---@diagnostic disable: undefined-global
require("mini.files").setup {
  mappings = {
    show_help = "?",
    go_in_plus = "<cr>",
    go_out_plus = "-",
    synchronize = "<leader>s",
  },
  windows = { preview = false },
  options = { permanent_delete = false },
}

local set_cwd = function()
  local path = (MiniFiles.get_fs_entry() or {}).path
  if path == nil then return vim.notify "Cursor is not on valid entry" end
  vim.fn.chdir(vim.fs.dirname(path))
end

local term = function()
  local entry = MiniFiles.get_fs_entry() or {}
  local dir = entry.path
  if entry.fs_type == "file" then dir = vim.fs.dirname(entry.path) end

  if dir == nil then return vim.notify "Cursor is not on valid entry" end

  local cur_target = MiniFiles.get_explorer_state().target_window
  local term_win = vim.api.nvim_win_call(cur_target, function()
    vim.cmd "split"
    return vim.api.nvim_get_current_win()
  end)

  vim.api.nvim_win_call(term_win, function() vim.cmd("term cd " .. vim.fn.fnameescape(dir) .. " && $SHELL") end)

  MiniFiles.close()
end

local ui_open = function() vim.ui.open(MiniFiles.get_fs_entry().path) end

local cmdline = function()
  local path = (MiniFiles.get_fs_entry() or {}).path
  if path == nil then return vim.notify "Cursor is not on valid entry" end

  local escaped = vim.api.nvim_replace_termcodes(
    ":Dispatch " .. vim.fn.fnameescape(path) .. "<Home><Right><Right><Right><Right><Right><Right><Right><Right><Space>",
    true,
    false,
    true
  )
  vim.api.nvim_feedkeys(escaped, "n", false)
end

local map_split = function(buf_id, lhs, direction)
  local rhs = function()
    local cur_target = MiniFiles.get_explorer_state().target_window
    local new_target = vim.api.nvim_win_call(cur_target, function()
      vim.cmd(direction .. " split")
      return vim.api.nvim_get_current_win()
    end)

    MiniFiles.set_target_window(new_target)
    MiniFiles.go_in { close_on_file = true }
  end

  vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = "Split " .. direction })
end

vim.api.nvim_create_autocmd("User", {
  pattern = "MiniFilesExplorerOpen",
  callback = function()
    MiniFiles.set_bookmark("c", vim.fn.stdpath "config")
    MiniFiles.set_bookmark("w", vim.fn.getcwd)
    MiniFiles.set_bookmark("h", "~")
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "MiniFilesBufferCreate",
  callback = function(args)
    local b = args.data.buf_id
    vim.keymap.set("n", "~", set_cwd, { buffer = b, desc = "Set cwd" })
    vim.keymap.set("n", "gx", ui_open, { buffer = b, desc = "OS open" })
    vim.keymap.set("n", "`", cmdline, { buffer = b, nowait = true, desc = "Run cmdline" })
    vim.keymap.set("n", "<C-\\>", term, { buffer = b, desc = "Terminal" })

    map_split(b, "<C-s>", "horizontal")
    map_split(b, "<C-v>", "vertical")
    map_split(b, "<C-t>", "tab")
  end,
})

vim.keymap.set("n", "-", function()
  local bufname = vim.api.nvim_buf_get_name(0)
  if bufname == "" or vim.bo.buftype == "terminal" or vim.bo.filetype == "fugitive" then
    MiniFiles.open()
    return
  end

  MiniFiles.open(vim.api.nvim_buf_get_name(0))
end)
