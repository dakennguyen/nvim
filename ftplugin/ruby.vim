inoremap bb byebug<esc>
nnoremap <leader>rr :vsplit term://ruby <c-r>=expand("%")<CR><CR>

nnoremap <space>trc :botright new <bar> term bundle exec spring stop && bundle exec rails c<cr>
