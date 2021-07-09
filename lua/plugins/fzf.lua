vim.env.FZF_DEFAULT_COMMAND = 'rg --files  --hidden --follow --glob "!{.git, node_modules}"'
vim.env.FZF_DEFAULT_OPTS = [[ --bind 'ctrl-e:preview-down,ctrl-y:preview-up,ctrl-d:preview-page-down,ctrl-u:preview-page-up' ]]

vim.g.fzf_preview_source = [[ --preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200']]
vim.g.fzf_layout = { down = '80%' }
vim.g.fzf_action = {
  ['ctrl-t'] = 'tab split',
  ['ctrl-s'] = 'split',
  ['ctrl-v'] = 'vsplit'
}
vim.g.fzf_colors = {
  fg =      {'fg', 'Normal'},
  bg =      {'bg', 'Normal'},
  hl =      {'fg', 'Comment'},
  ['fg+'] = {'fg', 'CursorLine', 'CursorColumn', 'Normal'},
  ['bg+'] =  {'bg', 'CursorLine', 'CursorColumn'},
  ['hl+'] =  {'fg', 'Statement'},
  info =    {'fg', 'PreProc'},
  border =  {'fg', 'Ignore'},
  prompt =  {'fg', 'Conditional'},
  pointer = {'fg', 'Exception'},
  marker =  {'fg', 'Keyword'},
  spinner = {'fg', 'Label'},
  header =  {'fg', 'Comment'}
}

-- Insert mode completion
vim.api.nvim_set_keymap('i', '<c-x><c-l>',
  "fzf#vim#complete(fzf#wrap({" ..
  [[ 'prefix': '^.*$', ]] ..
  [[ 'source': 'rg -n ^ --color always', 'options': '--ansi --delimiter : --nth 3..', ]] ..
  [[ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') } ]] ..
  "}))",
  { noremap = true, expr = true }
)

-- Insert mode completion for EH FE locale
vim.api.nvim_set_keymap('i', '<c-x><c-k>',
  "fzf#vim#complete(fzf#wrap({" ..
  [[ 'source': 'cat ~/Documents/Workspace/Thinkei/frontend-core/src/packages/eh-locale/lang/en-AU.json', ]] ..
  [[ 'reducer': { lines -> join(["Intl.formatMessage({ id: '", split(substitute(join(lines), '^\s*\(.\{-}\)\s*$', '\1', ''), '\"')[0], "' })"], "") } ]] ..
  "}))",
  { noremap = true, expr = true }
)
