setlocal commentstring=#\ %s

nnoremap <silent><buffer> <leader>rr :lua require('rest-nvim').run()<cr>
nnoremap <silent><buffer> <leader>rp :lua require('rest-nvim').run(true)<cr>
nnoremap <silent> <space>rl :lua require('rest-nvim').last()<cr>
