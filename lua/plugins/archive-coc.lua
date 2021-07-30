vim.g.coc_global_extensions = {
  'coc-eslint',
  'coc-prettier',
  'coc-css',
  'coc-solargraph',
  'coc-yaml',
  'coc-json',
  'coc-tsserver',
  'coc-markdownlint',
}

----------------------------------------------------
-- SECTION: <TAB> for Completion
----------------------------------------------------
map('i', '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]],     { expr = true })
map('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { expr = true })

----------------------------------------------------
-- SECTION: Remap <C-d> and <C-u> for scroll float windows/popups.
----------------------------------------------------
vim.cmd([[
  if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-d>"
    nnoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-u>"
    inoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    vnoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-d>"
    vnoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-u>"
  endif
]])

----------------------------------------------------
-- SECTION: GoTo Code Navigation
----------------------------------------------------
map('n', 'gdd', '<Plug>(coc-definition)',                            { noremap = false, silent = true })
map('n', 'gdv', [[call CocAction('jumpDefinition', 'vsplit') <CR>]], { noremap = false, silent = true })
map('n', 'gds', [[call CocAction('jumpDefinition', 'split') <CR>]],  { noremap = false, silent = true })
map('n', 'gh', [[call CocAction('doHover')<CR>]],                    { noremap = false, silent = true })
map('n', 'gy', '<Plug>(coc-type-definition)',                        { noremap = false, silent = true })
map('n', 'gi', '<Plug>(coc-implementation)',                         { noremap = false, silent = true })
map('n', 'gr', '<Plug>(coc-references)',                             { noremap = false, silent = true })
map('n', '<leader>ld', [[:call CocAction('diagnosticPreview')<CR>]])

map('n', '<leader>e', ':CocDiagnostics<CR>',                         { noremap = false, silent = true })
map('n', '[g', '<Plug>(coc-diagnostic-prev)',                        { noremap = false, silent = true })
map('n', ']g', '<Plug>(coc-diagnostic-next)',                        { noremap = false, silent = true })

_G.completion_confirm = function()
  if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info()['selected'] ~= -1 then
    vim.fn['coc#_select_confirm']()
  end
  return npairs.autopairs_cr()
end
map('i', '<CR>', 'v:lua._G.completion_confirm()', { expr = true })
