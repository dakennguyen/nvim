local M = {}

M.render = function()
  local s = ""
  for i = 1, vim.fn.tabpagenr "$" do
    local hl = (i == vim.fn.tabpagenr()) and "%#TabLineSel#" or "%#TabLine#"
    s = s .. hl .. " " .. i .. " "
  end
  return "%=" .. s
end

vim.o.tabline = "%!v:lua.require'config.tabline'.render()"

return M
