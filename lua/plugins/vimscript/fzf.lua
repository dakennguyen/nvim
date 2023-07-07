return {
  "junegunn/fzf.vim",
  dependencies = {
    "junegunn/fzf",
    build = function()
      vim.fn["fzf#install"]()
    end,
  },
  event = "VeryLazy",
  config = function()
    vim.env.FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*" --glob "!node_modules/*"'
    vim.env.FZF_DEFAULT_OPTS = "--bind ctrl-e:preview-down,ctrl-y:preview-up,ctrl-d:preview-page-down,"
      .. "ctrl-u:preview-page-up,tab:toggle-out,shift-tab:toggle-in"

    vim.cmd [[
      let s:TYPE = {
        \ 'bool': type(0),
        \ 'dict': type({}),
        \ 'funcref': type(function('call')),
        \ 'string': type(''),
        \ 'list': type([])
      \ }
      let s:default_action = {}

      function! BuildQuickfixList(lines)
        call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
        copen
      endfunction

      function! s:action_for(key, ...)
        let default = a:0 ? a:1 : ''
        let Cmd = get(get(g:, 'fzf_action', s:default_action), a:key, default)
        return type(Cmd) == s:TYPE.string ? Cmd : default
      endfunction

      function! s:find_open_window(b)
        let [tcur, tcnt] = [tabpagenr() - 1, tabpagenr('$')]
        for toff in range(0, tabpagenr('$') - 1)
          let t = (tcur + toff) % tcnt + 1
          let buffers = tabpagebuflist(t)
          for w in range(1, len(buffers))
            let b = buffers[w - 1]
            if b == a:b
              return [t, w]
            endif
          endfor
        endfor
        return [0, 0]
      endfunction

      function! s:jump(t, w)
        execute a:t.'tabnext'
        execute a:w.'wincmd w'
      endfunction

      function! s:buffers_sink(lines, query, fullscreen)
        if len(a:lines) < 3
          " echo "lines0:".string(a:lines)
          return
        endif
        let b = matchstr(a:lines[2], '\[\zs[0-9]*\ze\]')
        let bufname=split(a:lines[2])[-1]
        let action = a:lines[1]
        " echo "lines0.5:".string(a:lines).",b:".b."(".string(bufname).")"
        if empty(action)
          " echo "lines1:".string(a:lines).",bdelete:".b."(".bufname.")"
          let [t, w] = s:find_open_window(b)
          if t
            call s:jump(t, w)
            return
          endif
          execute 'buffer' b
          echo "Switch to '".bufname."'"
          return
        endif
        if action==?'ctrl-d'
          execute 'bdelete' b
          " echo "lines2:".string(a:lines).",bdelete:".b."(".bufname.")"
          call BuffersWithDeleteAction(a:query, a:fullscreen)
        else
          let cmd = s:action_for(action)
          " echo "lines3:".string(a:lines).",cmd:".string(cmd).",b:".b."(".string(bufname).")"
          if !empty(cmd)
            execute 'silent' cmd
          endif
          execute 'buffer' b
        endif
      endfunction

      function! BuffersWithDeleteAction(query, fullscreen)
        let spec = { 'sink*': {lines -> s:buffers_sink(lines, a:query, a:fullscreen)},
              \ 'options': [
              \   '--print-query',
              \   '--prompt', 'Buffer> '
              \ ],
              \ 'placeholder': '{1}'
              \ }
        let spec._action = get(g:, 'fzf_action', s:default_action)
        call add(spec.options, '--expect=ctrl-d,'.join(keys(spec._action), ','))
        call fzf#vim#buffers(a:query, fzf#vim#with_preview(spec), a:fullscreen)
      endfunction

      command! -bar -bang -nargs=? -complete=dir FzfxBuffers call BuffersWithDeleteAction(<q-args>, <bang>0)
    ]]

    vim.g.fzf_history_dir = "~/.cache/fzf/fzf-history"
    vim.g.fzf_preview_window = { "right:50%", "ctrl-h" }
    vim.g.fzf_layout = { down = "80%" }
    vim.g.fzf_action = {
      -- ['enter']  = 'drop',
      -- ['ctrl-t'] = 'tab drop',
      ["ctrl-t"] = "tab split",
      ["ctrl-s"] = "split",
      ["ctrl-v"] = "vsplit",
      ["ctrl-q"] = vim.fn["BuildQuickfixList"],
    }
    vim.g.fzf_colors = {
      fg = { "fg", "Normal" },
      bg = { "bg", "Normal" },
      hl = { "fg", "Comment" },
      ["fg+"] = { "fg", "CursorLine", "CursorColumn", "Normal" },
      ["bg+"] = { "bg", "CursorLine", "CursorColumn" },
      ["hl+"] = { "fg", "Statement" },
      info = { "fg", "PreProc" },
      border = { "fg", "Ignore" },
      prompt = { "fg", "Conditional" },
      pointer = { "fg", "Exception" },
      marker = { "fg", "Keyword" },
      spinner = { "fg", "Label" },
      header = { "fg", "Comment" },
    }

    -- Insert mode completion
    map(
      "i",
      "<c-x><c-l>",
      "fzf#vim#complete(fzf#wrap({"
        .. [[ 'prefix': '^.*$', ]]
        .. [[ 'source': 'rg -n ^ --color always', 'options': '--ansi --delimiter : --nth 3..', ]]
        .. [[ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') } ]]
        .. "}))",
      { expr = true }
    )

    map("n", "<space>ff", ":Files<CR>", { silent = true })
    map("n", "<space>fd", ":Files %:p:h<CR>", { silent = true })
    map("n", "<space>fb", ":FzfxBuffers<CR>", { silent = true })
    map("n", "<space>fo", ":History<CR>", { silent = true })
    map("n", "<space>fh", ":Helptags<CR>", { silent = true })
    map("n", "<space>fm", ":Maps<CR>", { silent = true })
    map("n", "<space>fw", ":Rg <C-R><C-W><CR>", { silent = true })
    map("v", "<space>fw", [[y:Rg <C-R>=escape(@",'/\')<CR><CR>]], { silent = true })
    map("n", "<space>fc", ":History:<CR>")

    map("n", "<space>fs", ":Files local_scripts<CR>", { silent = true })

    map("n", "//", ":BLines<CR>")
    map("n", "\\", ":Rg ")
  end,
}
