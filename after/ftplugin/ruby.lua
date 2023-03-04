vim.cmd[[
  iabbrev <buffer> bb byebug<esc>
  iabbrev <buffer> rben <cmd>r ~/.dotfiles/snippet/rben.rb<cr><cmd>norm kdd<cr>
  iabbrev <buffer> rar <cmd>r ~/.dotfiles/snippet/rar.rb<cr><cmd>norm kdd<cr>
  iabbrev <buffer> rbundler <cmd>r ~/.dotfiles/snippet/rbundler.rb<cr><cmd>norm kdd<cr>
]]

buf_map('n', '`<cr>', ':vsplit term://ruby <c-r>=expand("%")<CR><CR>')
