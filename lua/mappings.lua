-- General
map('i', 'jk', '<esc>')
map('i', 'kj', '<esc>')
map('n', '<leader><space>', ':noh<cr>', { silent = true })
map('v', '*', [[y/\V<C-R>=escape(@",'/\')<CR><CR>]])
map('n', 'ss', ':w<cr>', { silent = true })

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
map('n', '<leader>t', ':tabnew<cr>', { silent = true })
map('n', '<C-N>', 'gt')
map('n', '<C-T>', 'gT')

-- Mark
map('n', [[']], [["'" . nr2char(getchar()) . "zt"]], { expr = true })
map('n', [[`]], [["`" . nr2char(getchar()) . "zt"]], { expr = true })

-- registers
map('', 'gp', '"0p')
map('', 'gP', '"0P')
map('', '<leader>y', '"*y')
-- map('n', '<leader>p', '"*p')

-- resize panes
map('n', '<Up>',    ':10winc +<CR>')
map('n', '<Down>',  ':10winc -<CR>')
map('n', '<Left>',  ':10winc <<CR>')
map('n', '<Right>', ':10winc ><CR>')

-- File
map('n', '<leader>fc',  [[ :saveas <C-R>=expand("%:p:h")<CR>/              ]] )                    -- File > Save As
map('n', '<leader>fyy', [[ :let @+=expand("%") | echo @+<CR>               ]] , { silent = true }) -- File > Copy > Relative File Path
map('n', '<leader>fyf', [[ ggVG"*y<c-o>                                    ]] , { silent = true }) -- File > Copy > File Content
map('n', '<leader>fyn', [[ :let @+=expand("%:t:r") | echo @+<CR>           ]] , { silent = true }) -- File > Copy > File Name without extension
-- map('n', '<leader>fyd', [[ :let @+=expand("%:h") | echo @+<CR>             ]] , { silent = true }) -- File > Copy > Directory Path
-- map('n', '<leader>fyl', [[ :let @+=expand("%").":".line(".") | echo @+<CR> ]] , { silent = true }) -- File > Copy > Relative File Path with Line number
-- map('n', '<leader>fyY', [[ :let @+=expand("%:p") | echo @+<CR>             ]] , { silent = true }) -- File > Copy > Full File Path
-- map('n', '<leader>fyn', [[ :let @+=expand("%:t:r") | echo @+<CR>           ]] , { silent = true }) -- File > Copy > File Name without extension
-- map('n', '<leader>fyN', [[ :let @+=expand("%:t") | echo @+<CR>             ]] , { silent = true }) -- File > Copy > File Name with extension

-- open files
map('n', 'gs', ':topleft 18 new ~/.dotfiles/scratch.vim<CR>', { silent = true })
map('n', '<leader>s', ':source ~/.config/nvim/init.lua<CR>:PackerCompile<cr>')
-- map('n', '<leader>ev', ':vsplit ~/.config/nvim/init.lua<cr>')

-- Ruby
map('n', '<leader>rr', ':call VimuxRunCommand(\'ruby\' . \' \' . expand(\"%\"))<CR>')

-- debugger
map('i', 'bb', 'debugger<esc>')

-- Tabs
map('n', '<leader>1', '1gt')
map('n', '<leader>2', '2gt')
map('n', '<leader>3', '3gt')
map('n', '<leader>4', '4gt')
map('n', '<leader>5', '5gt')
map('n', '<leader>6', '6gt')
map('n', '<leader>7', '7gt')
map('n', '<leader>8', '8gt')
map('n', '<leader>9', '9gt')
