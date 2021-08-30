nnoremap <buffer> cp<space> :Git pull<space>
nnoremap <buffer> cP<space> :Git push<space>

nnoremap <buffer> [ou :Git branch -u origin/<c-r>=system('git branch --show-current')<CR><BS><CR>
nnoremap <buffer> ]ou :Git branch -u origin/HEAD<CR>

nnoremap <buffer><nowait> gc :Merginal<CR>
nnoremap <buffer><silent> <leader>gz :Gclog -g stash<CR>
nnoremap <buffer><silent> <leader>gl :Gclog -n 50<CR>
