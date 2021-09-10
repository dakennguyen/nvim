-- General
-- map('v', 'p', '"_dP') -- Don't copy the replaced text after pasting in visual mode
map('n', '<space>so', ':source %<CR>:PackerCompile<cr>')
map('n', '<leader><space>', ':noh<cr>', { silent = true })
map('n', '<leader>s', ':w<cr>', { silent = true })
map('n', '<leader>a', '<C-^>')
map('n', 'Y', 'y$')
map('n', '!', ':R !')

-- gj, gk
-- map('n', 'j', 'gj')
-- map('n', 'k', 'gk')
-- map('v', 'j', 'gj')
-- map('v', 'k', 'gk')

-- search
map('v', '*', [[y/\V<C-R>=escape(@",'/\')<CR><CR>]])

-- quit
map('n', '<leader>q', ':close<cr><c-w><c-p>', { silent = true })
map('t', '<leader>q', '<C-\\><C-N>:bd!<CR>',  { silent = true })
vim.cmd[[
augroup Quit
  autocmd!
  autocmd BufReadPost quickfix nnoremap <silent> <buffer> <leader>q :q<CR>
  autocmd TermOpen * nnoremap <silent> <buffer> <leader>q :bd!<CR><c-w><c-p>
  autocmd FileType fugitive nmap <buffer> <leader>q gq
augroup END
]]

-- gf
map('', 'gff', 'gf')
map('', 'gfv', '<c-w>vgf')
map('', 'gfs', '<c-w>f')
map('', 'gft', '<c-w>gf')

-- gd
-- map('', 'gdd', 'gd')

-- term
map('n', '<c-w>\\', ':vs +te<cr>',      { silent = true })
map('n', '<c-w>-', ':sp +te<cr>',       { silent = true })

map('t', '<c-h>', '<C-\\><C-n><c-h>', { noremap = false })
map('t', '<c-j>', '<C-\\><C-n><c-j>', { noremap = false })
map('t', '<c-k>', '<C-\\><C-n><c-k>', { noremap = false })
map('t', '<c-l>', '<C-\\><C-n><c-l>', { noremap = false })

-- quickfix and loclist
map('n', '<leader>c', ':copen<cr>', { silent = true })
map('n', '<leader>l', ':lopen<cr>', { silent = true })

-- fold
-- map('n', '<cr>', 'za')

-- zoom
map('n', '<leader>z', '<C-W>_<C-W><Bar>')
map('t', '<leader>z', '<C-\\><C-N><C-W>_<C-W><Bar>i')

-- tag
map('n', '<c-]>]',     'g<c-]>')
map('n', '<c-]><c-]>', 'g<c-]>')

map('n', '<c-]>v',     '<c-w>vg<c-]>')
map('n', '<c-]><c-v>', '<c-w>vg<c-]>')

map('n', '<c-]>s',     '<c-w>g<c-]>')
map('n', '<c-]><c-s>', '<c-w>g<c-]>')

map('n', '<c-]>t',     '<c-w>g<c-]><c-w>T')
map('n', '<c-]><c-t>', '<c-w>g<c-]><c-w>T')

map('n', '<c-w>}',     '<c-w>g}')

-- tab
map('n', ']<tab>', 'gt')
map('n', '[<tab>', 'gT')
map('n', '<leader>t', ':tabnew<cr>', { silent = true })

-- keep center
-- map('n', [[']], [["'" . nr2char(getchar()) . "zt"]], { expr = true })
-- map('n', [[`]], [["`" . nr2char(getchar()) . "zt"]], { expr = true })
map('n', 'J', 'mzJ`z')

-- jumplist mutations
map('n', 'k', [[ (v:count > 5 ? "m'" . v:count : "") . 'k' ]], { expr = true })
map('n', 'j', [[ (v:count > 5 ? "m'" . v:count : "") . 'j' ]], { expr = true })

-- registers
map('', 'gp', '"0p')
map('', 'gP', '"0P')
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
map('n', '<space>gs', ':topleft 18 new ~/Library/Mobile Documents/com~apple~CloudDocs/Notes/scratch.vim<CR>', { silent = true })
map('n', '<space>gn', ':vert botright 80 new ~/Library/Mobile Documents/com~apple~CloudDocs/Notes/<cr>', { silent = true })

-- open files in chrome
map('n', '<leader>fp', [[<cmd>!open -a 'google chrome' '%:p'<cr>]], { silent = true })
