" https://github.com/arithran/vim-delete-hidden-buffers
"
"
if !exists("*DeleteHiddenBuffers") " Clear all hidden buffers when running
  function DeleteHiddenBuffers() " Vim with the 'hidden' option
    let tpbl=[]
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
      silent execute 'bwipeout' buf
    endfor
  endfunction
endif
command! DeleteHiddenBuffers call DeleteHiddenBuffers()
