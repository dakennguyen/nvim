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
      function! BuildQuickfixList(lines)
        call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
        copen
      endfunction
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
    map("n", "<space>fb", ":Buffers<CR>", { silent = true })
    map("n", "<space>fo", ":History<CR>", { silent = true })
    map("n", "<space>fh", ":Helptags<CR>", { silent = true })
    map("n", "<space>fk", ":Maps<CR>", { silent = true })
    map("n", "<space>fw", ":Rg <C-R><C-W><CR>", { silent = true })
    map("v", "<space>fw", [[y:Rg <C-R>=escape(@",'/\')<CR><CR>]], { silent = true })

    map("n", "//", ":BLines<CR>")
    map("n", "\\", ":Rg ")
  end,
}
