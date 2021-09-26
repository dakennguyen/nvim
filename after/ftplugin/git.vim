setlocal foldmethod=syntax

nmap <buffer><nowait> <c-s> o
nmap <buffer><nowait> <c-v> gO
nmap <buffer><nowait> <c-t> O

nnoremap <buffer> cl<space> :Git pull<space>
nnoremap <buffer> cp<space> :Git push<space>
nnoremap <buffer> ch<space> :Git fetch<space>
nnoremap <buffer> cH<space> :Git remote update origin --prune<space>
nnoremap <buffer> cd<space> :vert Git diff<space>
