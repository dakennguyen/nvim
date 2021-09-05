nnoremap <buffer> cl<space> :Git pull<space>
nnoremap <buffer> cp<space> :Git push<space>
nnoremap <buffer> ch<space> :Git fetch<space>
nnoremap <buffer> cH<space> :Git fetch --all<space>

nnoremap <buffer> [ou :Git branch -u origin/<c-r>=system('git branch --show-current')<CR><BS><CR>
nnoremap <buffer> ]ou :Git branch -u origin/HEAD<CR>

nnoremap <buffer><nowait> go :Merginal<CR>
nnoremap <buffer><silent> <leader>gz <c-w>v:Gclog -g stash<CR><c-w>p
nnoremap <buffer><silent> <leader>gc <c-w>v:Gclog -n 50<CR><c-w>p
nnoremap <buffer><silent> <leader>gd :vert Git diff origin/HEAD..HEAD<CR>
