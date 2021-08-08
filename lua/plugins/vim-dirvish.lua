vim.g.dirvish_mode = [[:sort ,^\v(.*[\/])|\ze,]]
vim.g.dirvish_relative_paths = 1
vim.cmd[[
augroup dirvish_config
  autocmd!
  autocmd FileType dirvish call DirvishConfig()
augroup END

function! DirvishConfig()
  nnoremap <silent><buffer><nowait> t :call dirvish#open('tabedit', 0)<CR>
  xnoremap <silent><buffer><nowait> t :call dirvish#open('tabedit', 0)<CR>
  nnoremap <silent><buffer><nowait> o :call dirvish#open('split', 0)<CR>
  nnoremap <silent><buffer><nowait> v :call dirvish#open('vsplit', 0)<CR>

  nnoremap <buffer><nowait> % :e %
  nnoremap <buffer><nowait> d :!mkdir -p %
  nnoremap <buffer><nowait> R :!mv <c-r><c-f> <c-r><c-f>
  nmap <buffer><nowait> D .rm -rf
  xmap <buffer><nowait> D .rm -rf
endfunction
]]
