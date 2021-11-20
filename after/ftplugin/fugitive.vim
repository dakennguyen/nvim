nmap <buffer><nowait> <c-s> o
nmap <buffer><nowait> <c-v> gO
nmap <buffer><nowait> <c-t> O

nnoremap <buffer> cl<space> :Git pull<space>
nnoremap <buffer> cp<space> :Git push<space>
nnoremap <buffer> ch<space> :Git fetch<space>
nnoremap <buffer> cH<space> :Git remote update origin --prune<space>
nnoremap <buffer> cd<space> :vert Git diff<space>

nnoremap <buffer> [ou :Git branch -u origin/<c-r>=system('git branch --show-current')<CR><BS><CR>
nnoremap <buffer> ]ou :Git branch -u origin/HEAD<CR>

nnoremap <buffer><nowait> go :Merginal<CR>
nnoremap <buffer><silent> <leader>gz :Gclog! -g stash<CR>:close<cr><c-w><c-p>
nnoremap <buffer><silent> <leader>gc :Gclog! -n 50<CR>:close<cr><c-w><c-p>
nnoremap <buffer><silent> <leader>gd :vert Git diff origin/HEAD..HEAD<CR>
