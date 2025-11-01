_G.__global_callbacks = {}
_G.global = {
  _store = {},
}

-- example:
-- vim.keymap.set("n", "[e", repeatable("n", "<Plug>(MoveUp)", function()
--   vim.cmd("move -2")
-- end))
local repeatable = function(mode, lhs, rhs)
  vim.validate {
    mode = { mode, { "string", "table" } },
    rhs = { rhs, { "string", "function" }, lhs = { name = "string" } },
  }
  if not vim.startswith(lhs, "<Plug>") then error("`lhs` should start with `<Plug>`, given: " .. lhs) end
  vim.keymap.set(mode, lhs, function()
    rhs()
    vim.fn["repeat#set"](vim.api.nvim_replace_termcodes(lhs, true, true, true))
  end)
  return lhs
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

local dev_paths = function()
  local dev_paths = os.getenv "PROJECT_PATHS_STR"
  if not dev_paths then return {} end

  return vim.split(dev_paths, ":", { trimempty = true })
end

_G.repeatable = repeatable
_G.lazy_load = lazy_load
_G.augroup = augroup
_G.dev_paths = dev_paths()
_G.progress_status = { client = nil, title = nil }
