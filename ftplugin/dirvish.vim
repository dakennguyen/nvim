nmap <buffer> <leader>a gq

nnoremap <silent><buffer><nowait> t :call dirvish#open('tabedit', 0)<CR>
xnoremap <silent><buffer><nowait> t :call dirvish#open('tabedit', 0)<CR>
nnoremap <silent><buffer><nowait> o :call dirvish#open('split', 0)<CR>
nnoremap <silent><buffer><nowait> v :call dirvish#open('vsplit', 0)<CR>

nnoremap <buffer><nowait> % :e %
nnoremap <buffer><nowait> d :!mkdir -p %
nnoremap <buffer><nowait> R :!mv <c-r><c-f> <c-r><c-f>
nmap <buffer><nowait> D .rm -rf
xmap <buffer><nowait> D .rm -rf
