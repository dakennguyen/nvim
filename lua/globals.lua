_G.__global_callbacks = {}
_G.global = {
  _store = {},
}

local map = vim.keymap.set

local buf_map = function(mode, lhs, rhs, opts)
  local options = { buffer = true }
  if opts then options = vim.tbl_extend("force", options, opts) end
  vim.keymap.set(mode, lhs, rhs, options)
end

local augroup = function(name, commands)
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

            if plugin == "nvim-lspconfig" then vim.cmd "silent! do FileType" end
          end)
        else
          require("lazy").load { plugins = plugin }
        end
      end
    end,
  })
end

local fold_text = function()
  local signcolumn_length = 12 -- 5 for signs and 7 for line number
  local indent_level = vim.fn.indent(vim.v.foldstart)
  local start_line = vim.fn.getline(vim.v.foldstart):gsub("^%s+", "")
  local end_line = vim.fn.getline(vim.v.foldend):gsub("^%s+", "")
  local title = string.format("%s ... %s", start_line, end_line)
  local line_count = string.format("%d lines", vim.v.foldend - vim.v.foldstart + 1)
  local content_len = signcolumn_length + indent_level + #title + #line_count
  local fillchar_count = vim.api.nvim_win_get_width(0) - content_len

  return string.rep(" ", indent_level)
    .. title
    .. (fillchar_count >= 10 and string.rep(" ", fillchar_count) .. line_count or "")
end

local dev_paths = function()
  local dev_paths = os.getenv "PROJECT_PATHS_STR"
  if not dev_paths then return {} end

  return vim.split(dev_paths, ":", { trimempty = true })
end

_G.map = map
_G.buf_map = buf_map
_G.lazy_load = lazy_load
_G.augroup = augroup
_G.fold_text = fold_text
_G.dev_paths = dev_paths()
_G.lsp_progressing = false
