local job = require("plenary.job")
_G.open_in_browser = function(url)
  local command = vim.loop.os_uname().sysname == "Darwin" and "open"
    or "xdg-open"
  job:new({ command = command, args = { url } }):start()
end

vim.opt.diffopt:append { 'vertical' }
vim.cmd[[ command! -nargs=? Browse lua _G.open_in_browser(<q-args>) ]]

map('n', 'gb', ':Git blame<CR>',               { silent = true }) -- Git Blame
map('n', '<leader>gd', ':Gdiffsplit<CR>',      { silent = true }) -- Git diff
map('n', '<leader>gt', ':0Gclog<CR>',          { silent = true }) -- Git time machine
map('n', '<leader>gl', ':GBrowse<CR>',         { silent = true }) -- Git Browse
map('v', '<leader>gl', [[:'<,'>.GBrowse<CR>]], { silent = true }) -- Git Browse in Visual mode

map('n', '<space>gs', ':Glog -g stash<CR>',    { silent = true }) -- Git stash
