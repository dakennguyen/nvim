if exists('g:loaded_fzf_buffer_lines')
  finish
endif
let g:loaded_fzf_buffer_lines = 1

function! s:fzf_buffer_lines_sink(line) abort
  let lnum = str2nr(matchstr(a:line, '^\s*\d\+'))
  if lnum <= 0
    return
  endif
  execute lnum
  normal! ^zz
endfunction

function! FzfBufferLines() abort
  if !exists('*fzf#run') || !exists('*fzf#wrap')
    echoerr 'FzfBufferLines: fzf.vim is not available'
    return
  endif

  let lines = getline(1, '$')
  call map(lines, { idx, val -> printf('%d:%s', idx + 1, val) })

  let opts = {
        \ 'source': lines,
        \ 'sink': function('s:fzf_buffer_lines_sink'),
        \ 'options': [
        \   '--no-multi',
        \   '--prompt', 'BLines> ',
        \   '--delimiter', ':',
        \   '--with-nth', '2..',
        \ ],
        \ }
  call fzf#run(fzf#wrap('FzfBufferLines', opts, 0))
endfunction

command! FzfBufferLines call FzfBufferLines()
