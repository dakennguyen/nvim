setlocal foldmethod=syntax

nnoremap <buffer> cl<space> :Git pull<space>
nnoremap <buffer> cp<space> :Git push<space>
nnoremap <buffer> ch<space> :Git fetch<space>
nnoremap <buffer> cH<space> :Git fetch --all<space>
nnoremap <buffer> cd<space> :vert Git diff<space>
