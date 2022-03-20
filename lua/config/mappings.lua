-- Packer
map('n', '<space>ps', ':PackerSync<cr>')
map('n', '<space>pi', ':PackerInstall<cr>')
map('n', '<space>pc', ':PackerClean<cr>')

-- General
map('n', '<space>rl', '<cmd>lua require("utils").reload_config()<cr>')
map('n', '<space>so', ':source %<CR>:PackerCompile<cr>')
map('n', '<leader><space>', ':noh<cr>', { silent = true })
map('n', '<leader>s', ':w<cr>', { silent = true })
map('n', '<leader>a', '<C-^>')
map('n', '!', ':!')

-- jk
map('n', 'j', '<cmd>lua require("utils").jump("j")<cr>', { silent = true })
map('n', 'k', '<cmd>lua require("utils").jump("k")<cr>', { silent = true })

-- search
map('v', '*', [[y/\V<C-R>=escape(@",'/\')<CR><CR>]])

-- quit
map('n', '<leader>q', '<cmd>lua require("utils").smart_quit()<cr>', { silent = true })
map('t', '<leader>q', '<C-\\><C-N>:q<CR>',    { silent = true })

-- gf
map('', 'gff', 'gf')
map('', 'gfv', '<cmd>lua require("utils").vsplit("gf")<cr>')
map('', 'gfs', '<c-w>f')
map('', 'gft', '<c-w>gf')

-- gd
-- map('', 'gdd', 'gd')

-- session
map('n', '<space>ss', ':mksession! Session.vim<CR>')
map('n', '<space>sq', ':mksession! Session.vim<CR>:qa<CR>')
map('n', '<space>sl', ':source Session.vim<CR>', { silent = true })

-- macro
map('x', '@', ':<C-u><cmd>lua require("utils").visual_macro()<CR>')

-- term
map('n', '<c-w>\\', ':vs +te<cr>',      { silent = true })
map('n', '<c-w>-', ':sp +te<cr>',       { silent = true })

-- quickfix and loclist
map('n', '<leader>c', ':copen<cr>', { silent = true })
map('n', '<leader>l', ':lopen<cr>', { silent = true })

-- fold
-- map('n', '<cr>', 'za')
map('n', 'zV', ':normal zMzvzz<CR>', { silent = true })

-- zoom
map('n', '<leader>z', '<C-W>_<C-W><Bar>')
map('t', '<leader>z', '<C-\\><C-N><C-W>_<C-W><Bar>i')

-- tag
map('n', '<c-]>]',     'g<c-]>')
map('n', '<c-]><c-]>', 'g<c-]>')

map('n', '<c-]>v',     '<cmd>lua require("utils").vsplit("g<c-]>")<cr>')
map('n', '<c-]><c-v>', '<cmd>lua require("utils").vsplit("g<c-]>")<cr>')

map('n', '<c-]>s',     '<c-w>g<c-]>')
map('n', '<c-]><c-s>', '<c-w>g<c-]>')

map('n', '<c-]>t',     '<c-w>g<c-]><c-w>T')
map('n', '<c-]><c-t>', '<c-w>g<c-]><c-w>T')

map('n', '<c-]>p',     '<c-w>g}')
map('n', '<c-]><c-p>', '<c-w>g}')

-- tab
map('n', ']<tab>', 'gt')
map('n', '[<tab>', 'gT')
map('n', '<c-w><c-l>', '<cmd>+1tabmove<cr>')
map('n', '<c-w>l',     '<cmd>+1tabmove<cr>')
map('n', '<c-w><c-h>', '<cmd>-1tabmove<cr>')
map('n', '<c-w>h',     '<cmd>-1tabmove<cr>')
map('n', '<leader>t', ':tabnew<cr>', { silent = true })
map('n', '<leader>w', '<cmd>lua require("utils").tabclose()<CR>', { silent = true })

-- keep center
-- map('n', [[']], [["'" . nr2char(getchar()) . "zt"]], { expr = true })
-- map('n', [[`]], [["`" . nr2char(getchar()) . "zt"]], { expr = true })
map('n', 'J', 'mzJ`z')
map('n', 'K', 'i<CR><ESC>l', { silent = true })

-- registers
-- map('v', 'p', '"_dP') -- Don't copy the replaced text after pasting in visual mode
map('', 'gp', '"0p')
map('', 'gP', '"0P')
map('', '<leader>y', '"*y')
map('', '<leader>p', '"*p')

-- resize panes
-- map('n', '<Up>',    ':10winc +<CR>', { silent = true })
-- map('n', '<Down>',  ':10winc -<CR>', { silent = true })
-- map('n', '<Left>',  ':10winc <<CR>', { silent = true })
-- map('n', '<Right>', ':10winc ><CR>', { silent = true })

-- File
map('n', '<leader>fc',  [[:saveas <C-R>=expand("%")<CR>]])                                      -- File > Save As
map('n', '<leader>fyy', [[:let @+=expand("%") | echo @+<CR>]],               { silent = true }) -- File > Copy > Relative File Path
map('n', '<leader>fyY', [[:let @+=expand("%:p") | echo @+<CR>]],             { silent = true }) -- File > Copy > Full File Path
map('n', '<leader>fyf', [[ggVG"*y<c-o>]],                                    { silent = true }) -- File > Copy > File Content
map('n', '<leader>fyn', [[:let @+=expand("%:t:r") | echo @+<CR>]],           { silent = true }) -- File > Copy > File Name without extension
map('n', '<leader>fyN', [[:let @+=expand("%:t") | echo @+<CR>]],             { silent = true }) -- File > Copy > File Name with extension
map('n', '<leader>fyl', [[:let @+=expand("%").":".line(".") | echo @+<CR>]], { silent = true }) -- File > Copy > Relative File Path with Line number
-- map('n', '<leader>fyd', [[ :let @+=expand("%:h") | echo @+<CR>             ]] , { silent = true }) -- File > Copy > Directory Path

-- open files
map('n', '<space>gs', ':vert botright 80 new $CLOUD/Notes/scratch.md<CR>', { silent = true })
map('n', '<space>gt', ':botright 10 new $CLOUD/Notes/todo.md<CR>', { silent = true })
map('n', '<space>gn', ':vert botright 80 new $CLOUD/Notes/<cr>', { silent = true })
map('n', '<space>gr', ':tabnew $CLOUD/Rests/<cr>', { silent = true })

-- open files in chrome
map('n', '<leader>fp', [[<cmd>!open -a 'google chrome' '%:p'<cr>]], { silent = true })
