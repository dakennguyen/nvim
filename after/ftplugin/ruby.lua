vim.cmd[[
  iabbrev <buffer> bb byebug<esc>
  iabbrev <buffer> rben <cmd>r ~/.dotfiles/snippet/rben.rb<cr><cmd>norm ggddG<cr>
  iabbrev <buffer> rar <cmd>r ~/.dotfiles/snippet/rar.rb<cr><cmd>norm ggddG<cr>
]]

buf_map('n', '<leader>rr', ':vsplit term://ruby <c-r>=expand("%")<CR><CR>')
