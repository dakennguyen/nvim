return {
  'hrsh7th/vim-vsnip',
  event = 'InsertEnter',
  config = function()
    vim.cmd([[
    nmap        s   <Plug>(vsnip-select-text)
    xmap        s   <Plug>(vsnip-select-text)

    imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
    smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
    ]])
  end,
}
