local utils = require "utils"

-- General
map("n", "<leader>0", ":e<cr>")
map("n", "<leader><space>", ":noh<cr>", { silent = true })
map("n", "<leader>s", ":w<cr>", { silent = true })
map("n", "<leader>w", "<c-w>", { silent = true })
map("n", "0", "^")
map("", "$", "g_", { silent = true })

-- jk
map("n", "j", function() utils.jump "j" end, { silent = true })
map("n", "k", function() utils.jump "k" end, { silent = true })

-- search
map("n", "#", "#<S-N>", { silent = true })
map("n", "*", "*<S-N>", { silent = true })
map("v", "#", [[y?\V<C-R>=escape(@",'/\')<CR><CR><S-N>]])
map("v", "*", [[y/\V<C-R>=escape(@",'/\')<CR><CR><S-N>]])

-- replace
map("v", "<leader>er", [[y/\V<C-R>=escape(@",'/\')<CR><CR>:%s/<C-r>"/]])
map("v", "<space>er", [[y/\V<C-R>=escape(@",'/\')<CR><CR>:cfdo %s/<C-r>"/]])

-- quit
map("n", "<leader>q", utils.smart_quit, { silent = true })
map("t", "<leader>q", "<C-\\><C-N>:q<CR>", { silent = true })

-- gf
map("", "gff", "gf")
map("", "gfv", function() utils.vsplit "gf" end)
map("", "gfs", "<c-w>f")
map("", "gft", "<c-w>gf")

-- session
map("n", "<space>ss", ":mksession!<CR>")
map("n", "<space>sq", ":mksession!<CR>:qa<CR>")
map("n", "<space>sl", utils.load_session, { silent = true })

-- macro
map("x", "@", '":norm @" . getcharstr() . "<cr>"', { expr = true })

-- marks
for i = string.byte "A", string.byte "z" do
  local char = string.char(i)
  if char:match "[A-Za-z]" then map("n", "dm" .. char, ":delmarks " .. char .. "<CR>", { silent = true }) end
end

-- quickfix and loclist
map("n", "<leader>c", ":botright copen<cr>", { silent = true })
map("n", "<leader>l", ":lopen<cr>", { silent = true })

-- fold
map("n", "zV", ":normal zMzvzz<CR>", { silent = true })
map("n", "[of", ":setlocal foldmethod=indent<cr>")
map("n", "]of", ":setlocal foldmethod=expr<cr>")
map("n", "yof", function()
  if vim.opt_local.foldmethod:get() == "indent" then
    vim.opt_local.foldmethod = "expr"
    vim.cmd 'echo ":setlocal foldmethod=expr"'
  else
    vim.opt_local.foldmethod = "indent"
    vim.cmd 'echo ":setlocal foldmethod=indent"'
  end
end)

-- move screen
map("n", "zZ", "zszH", { silent = true })

-- zoom
map("n", "<leader>z", "<C-W>_<C-W><Bar>")
map("t", "<leader>z", "<C-\\><C-N><C-W>_<C-W><Bar>i")

-- tag
map("n", "<c-]>]", "g<c-]>", { remap = true })
map("n", "<c-]><c-]>", "g<c-]>", { remap = true })

map("n", "<c-]>v", ":vsplit<cr>g<c-]>", { remap = true })
map("n", "<c-]><c-v>", ":vsplit<cr>g<c-]>", { remap = true })

map("n", "<c-]>s", "<c-w>g<c-]>", { remap = true })
map("n", "<c-]><c-s>", "<c-w>g<c-]>", { remap = true })

map("n", "<c-]>t", "<c-w>g<c-]><c-w>T", { remap = true })
map("n", "<c-]><c-t>", "<c-w>g<c-]><c-w>T", { remap = true })

map("n", "<c-]>p", "<c-w>g}", { remap = true })
map("n", "<c-]><c-p>", "<c-w>g}", { remap = true })

-- tab
map("n", "]<tab>", "gt")
map("n", "[<tab>", "gT")
map("t", "]<tab>", "<c-\\><c-n>Ggt")
map("t", "[<tab>", "<c-\\><c-n>GgT")
map("n", "<leader>t", ":tabnew<cr>", { silent = true })
map("n", "<leader>x", utils.tabclose, { silent = true })

-- keep center
-- map('n', [[']], [["'" . nr2char(getchar()) . "zt"]], { expr = true })
-- map('n', [[`]], [["`" . nr2char(getchar()) . "zt"]], { expr = true })

-- join and break line
map("n", "J", "mzJ`z")
map("n", "S", "i<CR><ESC>l", { silent = true })

-- registers
-- map('v', 'p', '"_dP') -- Don't copy the replaced text after pasting in visual mode
map("", "gp", '"0p')
map("", "gP", '"0P')
map("", "<leader>y", '"*y')
map("", "<leader>p", '"*p')

-- resize panes
map("n", "<leader>w<Up>", ":10winc +<CR>", { silent = true })
map("n", "<leader>w<Down>", ":10winc -<CR>", { silent = true })
map("n", "<leader>w<Left>", ":10winc <<CR>", { silent = true })
map("n", "<leader>w<Right>", ":10winc ><CR>", { silent = true })

-- File
-- File > Save As
map("n", "<leader>fc", [[:saveas <C-R>=expand("%")<CR>]])
-- File > Copy > Relative File Path
map("n", "<leader>fyy", [[:let @+=expand("%") | echo @+<CR>]], { silent = true })
-- File > Copy > Full File Path
map("n", "<leader>fyY", [[:let @+=expand("%:p") | echo @+<CR>]], { silent = true })
-- File > Copy > File Content
map("n", "<leader>fyf", [[ggVG"*y<c-o>]], { silent = true })
-- File > Copy > File Name without extension
map("n", "<leader>fyn", [[:let @+=expand("%:t:r") | echo @+<CR>]], { silent = true })
-- File > Copy > File Name with extension
map("n", "<leader>fyN", [[:let @+=expand("%:t") | echo @+<CR>]], { silent = true })
-- File > Copy > Relative File Path with Line number
map("n", "<leader>fyl", [[:let @+=expand("%").":".line(".") | echo @+<CR>]], { silent = true })
-- File > Copy > Directory Path
-- map('n', '<leader>fyd', [[ :let @+=expand("%:h") | echo @+<CR>             ]] , { silent = true })

-- open files
map("n", "<space>gn", ":vert botright 80 new $CLOUD/Notes<CR>", { silent = true })
map("n", "<space>gs", ":botright 20 new $CLOUD/Notes/scratch.md<CR>", { silent = true })
map("n", "<space>gt", ":botright 10 new $CLOUD/Notes/todo.md<CR>", { silent = true })
map("n", "<space>gh", ":vnew local.http<cr>", { silent = true })

-- navigation
map("n", "<left>", "<c-w>h", { silent = true })
map("n", "<down>", "<c-w>j", { silent = true })
map("n", "<up>", "<c-w>k", { silent = true })
map("n", "<right>", "<c-w>l", { silent = true })
map("n", "<c-h>", "<c-w>h", { silent = true })
map("n", "<c-j>", "<c-w>j", { silent = true })
map("n", "<c-k>", "<c-w>k", { silent = true })
map("n", "<c-l>", "<c-w>l", { silent = true })
map("t", "<c-h>", "<c-\\><c-n><c-w>h", { silent = true })
map("t", "<c-j>", "<c-\\><c-n><c-w>j", { silent = true })
map("t", "<c-k>", "<c-\\><c-n><c-w>k", { silent = true })
map("t", "<c-l>", "<c-\\><c-n><c-w>l", { silent = true })
