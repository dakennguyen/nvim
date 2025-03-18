local M = {}

-- local replace_vim_system = function(input)
--   return input:gsub("%${VIM:system%('(.-)'%)%}", function(cmd)
--     local output = vim.fn.system(cmd):gsub("\n", "")
--     return output
--   end)
-- end

local get_buf_snips = function()
  local ft = vim.bo.filetype
  if not ft then return {} end

  local file_path = string.format("%s/snippets/%s.json", vim.fn.stdpath "config", ft)
  local file = io.open(file_path, "r")
  if not file then return {} end

  local content = file:read "*a"
  file:close()

  local success, parsed_snips = pcall(vim.json.decode, content)
  if not success or type(parsed_snips) ~= "table" then
    vim.notify("Error parsing " .. file_path, vim.log.levels.ERROR)
    return {}
  end

  local snips = {}
  for _, v in pairs(parsed_snips) do
    if type(v.body) == "table" then v.body = table.concat(v.body, "\n") end
    table.insert(snips, v)
  end

  return snips
end

M.register_source = function(cmp, source_name)
  local cache = {}
  cmp.register_source(source_name, {
    complete = function(_, _, callback)
      local bufnr = vim.bo.filetype
      if not cache[bufnr] then
        local completion_items = vim.tbl_map(function(s)
          local item = {
            word = s.prefix,
            label = s.prefix,
            kind = vim.lsp.protocol.CompletionItemKind.Snippet,
            insertText = s.body,
            insertTextFormat = vim.lsp.protocol.InsertTextFormat.Snippet,
          }
          return item
        end, get_buf_snips())

        cache[bufnr] = completion_items
      end

      callback(cache[bufnr])
    end,
  })
end

return M
