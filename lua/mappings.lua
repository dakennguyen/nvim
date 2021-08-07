-- General
-- map('v', 'p', '"_dP') -- Don't copy the replaced text after pasting in visual mode
map('n', '<leader><space>', ':noh<cr>', { silent = true })
map('v', '*', [[y/\V<C-R>=escape(@",'/\')<CR><CR>]])
map('n', '<leader>s', ':w<cr>', { silent = true })
map('n', '<leader>a', '<C-^>')
map('n', '<leader>`', '`^')
map('i', '<c-h>', '<bs>', { noremap = false })
map('i', '<c-l>', '<del>', { noremap = false })
map('n', 'Y', 'y$')
map('n', '!', ':!')

-- gj, gk
-- map('n', 'j', 'gj')
-- map('n', 'k', 'gk')
-- map('v', 'j', 'gj')
-- map('v', 'k', 'gk')

-- gq
map('n', 'gq', ':close<cr><c-w><c-p>', { silent = true })
vim.cmd[[
augroup QuitQuickfix
  autocmd BufReadPost quickfix nnoremap <buffer> gq :q<CR>
augroup END
]]

-- gf
map('', 'gff', 'gf')
map('', 'gfv', '<c-w>vgf')
map('', 'gfs', '<c-w>f')
map('', 'gft', '<c-w>gf')

-- gd
-- map('', 'gdd', 'gd')

-- navigator
map('n', '<c-h>', '<c-w>h')
map('n', '<c-j>', '<c-w>j')
map('n', '<c-k>', '<c-w>k')
map('n', '<c-l>', '<c-w>l')


-- term
map('t', '<c-o>', '<C-\\><C-n>',   { noremap = false })
map('n', '<c-w>\\', ':vs +te<cr>', { silent = true })
map('n', '<c-w>-', ':sp +te<cr>',  { silent = true })

map('n', '<space>gg', ':tabnew | term lazygit<cr>')
map('n', '<space>gm', ':tabnew | term spt<cr>')

-- quickfix and loclist
map('n', '<leader>c', ':copen<cr>', { silent = true })
map('n', '<leader>l', ':lopen<cr>', { silent = true })

-- fold
map('n', '<cr>', 'za')

-- maximzer
map('n', 'Zz', '<C-W>_<C-W><Bar>')

-- tag
map('n', '<c-]>', 'g<c-]>')
map('n', '<c-w><c-]>', '<c-w>g<c-]>')
map('n', '<c-w>}', '<c-w>g}')

-- tab
map('n', ']<tab>', 'gt')
map('n', '[<tab>', 'gT')
map('n', '<leader>t', ':tabnew<cr>', { silent = true })

-- keep center
map('n', [[']], [["'" . nr2char(getchar()) . "zt"]], { expr = true })
map('n', [[`]], [["`" . nr2char(getchar()) . "zt"]], { expr = true })
map('n', 'J', 'mzJ`z')

-- jumplist mutations
vim.cmd[[ nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k' ]]
vim.cmd[[ nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j' ]]

-- registers
map('', 'cp', '"0p')
map('', 'cP', '"0P')
map('', '<leader>y', '"*y')
map('', '<leader>p', '"*p')

-- resize panes
map('n', '<Up>',    ':10winc +<CR>', { silent = true })
map('n', '<Down>',  ':10winc -<CR>', { silent = true })
map('n', '<Left>',  ':10winc <<CR>', { silent = true })
map('n', '<Right>', ':10winc ><CR>', { silent = true })

-- File
map('n', '<leader>fc',  [[:saveas <C-R>=expand("%")<CR>]])                             -- File > Save As
map('n', '<leader>fyy', [[:let @+=expand("%") | echo @+<CR>]] ,     { silent = true }) -- File > Copy > Relative File Path
map('n', '<leader>fyY', [[:let @+=expand("%:p") | echo @+<CR>]] ,   { silent = true }) -- File > Copy > Full File Path
map('n', '<leader>fyf', [[ggVG"*y<c-o>]] ,                          { silent = true }) -- File > Copy > File Content
map('n', '<leader>fyn', [[:let @+=expand("%:t:r") | echo @+<CR>]] , { silent = true }) -- File > Copy > File Name without extension
map('n', '<leader>fyN', [[:let @+=expand("%:t") | echo @+<CR>]] ,   { silent = true }) -- File > Copy > File Name with extension
-- map('n', '<leader>fyd', [[ :let @+=expand("%:h") | echo @+<CR>             ]] , { silent = true }) -- File > Copy > Directory Path
-- map('n', '<leader>fyl', [[ :let @+=expand("%").":".line(".") | echo @+<CR> ]] , { silent = true }) -- File > Copy > Relative File Path with Line number

-- open files
map('n', '<space>gs', ':topleft 18 new ~/.dotfiles/scratch.vim<CR>', { silent = true })
map('n', '<space>vs', ':source ~/.config/nvim/init.lua<CR>:PackerCompile<cr>')
map('n', '<space>gv', ':vsplit ~/.config/nvim/init.lua<cr>')

-- Ruby
map('n', '<leader>rr', ':call VimuxRunCommand(\'ruby\' . \' \' . expand(\"%\"))<CR>')

-- debugger
map('i', 'bb', 'debugger<esc>')

-- netrw
vim.cmd[[
  augroup netrw_mapping
    autocmd!
    autocmd filetype netrw call NetrwMapping()
  augroup END

  function! NetrwMapping()
    nnoremap ? :help netrw-quickmap<CR>
    nmap <buffer> <leader>0 <Plug>NetrwRefresh
    silent! unmap <buffer> <c-l>
  endfunction
]]
