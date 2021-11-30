iabbrev bb byebug<esc>
iabbrev rben <cmd>r ~/.dotfiles/snippet/rben.rb<cr><cmd>norm ggddG<cr>
iabbrev rar <cmd>r ~/.dotfiles/snippet/rar.rb<cr><cmd>norm ggddG<cr>

nnoremap <buffer> <leader>rr :vsplit term://ruby <c-r>=expand("%")<CR><CR>
