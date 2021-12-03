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

return M
