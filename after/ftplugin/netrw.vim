silent! unmap <buffer> mp
silent! unmap <buffer> <c-l>

nnoremap ? :help netrw-quickmap<CR>
nmap <buffer> <leader>0 <Plug>NetrwRefresh
vnoremap <buffer> mf :norm mf<cr>

nmap <buffer><silent> <space>gn :nnoremap <lt>silent> <lt>space>gn :vert botright 80 new <c-r><c-f><lt>cr><cr>
nmap <buffer><silent> <space>gr :nnoremap <lt>silent> <lt>space>gr :-1tabnew <c-r><c-f><lt>cr><cr>
nmap <buffer><silent> <leader>fp :!open -a 'google chrome' '<c-r><c-f>'<cr>
