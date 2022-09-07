buf_map('n', '<c-s>', 'o',  { noremap = false, nowait = true })
buf_map('n', '<c-v>', 'gO', { noremap = false, nowait = true })
buf_map('n', '<c-t>', 'O',  { noremap = false, nowait = true })

buf_map('n', 'cl<space>', ':Git pull<space>')
buf_map('n', 'cp<space>', ':Git push<space>')
buf_map('n', 'ch<space>', ':Git fetch<space>')
buf_map('n', 'cH<space>', ':Git remote update origin --prune')
buf_map('n', 'cd<space>', ':vert Git diff<space>')
buf_map('n', 'W', ':Git commit --no-verify<CR>')
buf_map('n', 'E', ':Git commit --amend --no-edit --no-verify')

buf_map('n', '[ou', [[:Git branch -u origin/<c-r>=system('git branch --show-current')<CR><BS><CR>]])
buf_map('n', ']ou', [[:Git branch -u origin/HEAD<CR>]])

buf_map('n', 'go', ':Merginal<CR>', { nowait = true })
buf_map('n', '<leader>gd', ':vert Git diff origin/HEAD..HEAD<CR>',     { silent = true })

vim.cmd[[
function! s:open(cmd)
  call execute(a:cmd)
  quit
  wincmd p
endfunction

nnoremap <silent><buffer> <leader>gz :call <sid>open('Gclog! -g stash')<CR>
nnoremap <silent><buffer> <leader>gc :call <sid>open('Gclog! -n 50')<CR>
]]
