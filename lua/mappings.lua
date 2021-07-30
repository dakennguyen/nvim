-- General
map('v', 'p', '"_dP') -- Don't copy the replaced text after pasting in visual mode
map('n', '<leader><space>', ':noh<cr>', { silent = true })
map('v', '*', [[y/\V<C-R>=escape(@",'/\')<CR><CR>]])
map('n', '<leader>s', ':w<cr>', { silent = true })
map('n', '<leader>a', '<C-^>')
map('i', '<c-h>', '<bs>', { noremap = false })
map('i', '<c-l>', '<del>', { noremap = false })

-- gj, gk
map('n', 'j', 'gj')
map('n', 'k', 'gk')
map('v', 'j', 'gj')
map('v', 'k', 'gk')

-- gq
map('n', 'gq', ':q<cr><c-w><c-p>', { silent = true })
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

-- quickfix
map('n', '<leader>c', ':copen<cr>', { silent = true })

-- Tab
map('n', '<leader>1', '1gt')
map('n', '<leader>2', '2gt')
map('n', '<leader>3', '3gt')
map('n', '<leader>4', '4gt')
map('n', '<leader>5', '5gt')
map('n', '<leader>6', '6gt')
map('n', '<leader>7', '7gt')
map('n', '<leader>8', '8gt')
map('n', '<leader>9', '9gt')
map('n', 'gn', 'gt')
map('n', 'gp', 'gT')
map('n', 'gt', ':tabnew<cr>', { silent = true })

-- Mark
map('n', [[']], [["'" . nr2char(getchar()) . "zt"]], { expr = true })
map('n', [[`]], [["`" . nr2char(getchar()) . "zt"]], { expr = true })

-- registers
-- map('', 'gp', '"0p')
-- map('', 'gP', '"0P')
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
