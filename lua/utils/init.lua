local M = {}

-- https://github.com/seblj/dotfiles/blob/master/nvim/lua/seblj/utils/init.lua
M.reload_config = function()
  vim.cmd('source ~/.config/nvim/init.lua')
  for pack, _ in pairs(package.loaded) do
    if pack:match('^config') or pack:match('^plugins') or pack:match('^utils') then
      package.loaded[pack] = nil
      require(pack)
    end
  end
  vim.cmd(':PackerCompile<cr>')
end

-- Does:
--   For wrapped lines, does gj/gk
--   For large jumps, adds a spot on the jump list
-- https://github.com/tjdevries/config_manager/blob/b9490fe7eb47e2bf21e828474787d8b8e8ed5314/xdg_config/nvim/autoload/tj.vim#L161
M.jump = function(letter)
  local count = vim.api.nvim_eval('v:count')
  if count == 0 then
    vim.cmd(string.format([[call execute('normal! g%s')]], letter))
    return
  end

  if count > 5 then
    vim.cmd([[call execute("normal! m'")]])
  end

  vim.cmd(string.format([[call execute('normal! %s%s', )]], count, letter))
end

return M
