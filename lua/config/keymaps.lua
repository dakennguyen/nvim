local utils = require "utils"

-- General
vim.keymap.set("n", "<leader>0", ":e<cr>")
vim.keymap.set("n", "<leader><space>", ":noh<cr>", { silent = true })
vim.keymap.set("n", "<leader>s", ":w<cr>", { silent = true })
vim.keymap.set("n", "<leader>w", "<c-w>", { silent = true })
vim.keymap.set("n", "0", "^")
vim.keymap.set("", "$", "g_", { silent = true })

-- jk
vim.keymap.set("n", "j", function() utils.jump "j" end, { silent = true })
vim.keymap.set("n", "k", function() utils.jump "k" end, { silent = true })

-- search
vim.keymap.set("n", "#", "#<S-N>", { silent = true })
vim.keymap.set("n", "*", "*<S-N>", { silent = true })
vim.keymap.set("v", "#", [[y?\V<C-R>=escape(@",'/\')<CR><CR><S-N>]])
vim.keymap.set("v", "*", [[y/\V<C-R>=escape(@",'/\')<CR><CR><S-N>]])

-- replace
vim.keymap.set("v", "<leader>er", [[y/\V<C-R>=escape(@",'/\')<CR><CR>:%s/<C-r>"/]])
vim.keymap.set("v", "<space>er", [[y/\V<C-R>=escape(@",'/\')<CR><CR>:cfdo %s/<C-r>"/]])

-- quit
vim.keymap.set("n", "<leader>q", utils.smart_quit, { silent = true })
vim.keymap.set("t", "<leader>q", "<C-\\><C-N>:q<CR>", { silent = true })

-- gf
vim.keymap.set("", "gff", "gf")
vim.keymap.set("", "gfv", function() utils.vsplit "gf" end)
vim.keymap.set("", "gfs", "<c-w>f")
vim.keymap.set("", "gft", "<c-w>gf")

-- session
vim.keymap.set("n", "<space>ss", ":mksession!<CR>")
vim.keymap.set("n", "<space>sq", ":mksession!<CR>:qa<CR>")
vim.keymap.set("n", "<space>sl", utils.load_session, { silent = true })
vim.keymap.set("n", "<space>sd", utils.delete_session, { silent = true })

-- macro
vim.keymap.set("x", "@", '":norm @" . getcharstr() . "<cr>"', { expr = true })
vim.keymap.set("n", "Q", repeatable("n", "<Plug>(RepeatableQ)", function() vim.cmd "normal! Q" end), { remap = true })

-- marks
for i = string.byte "A", string.byte "z" do
  local char = string.char(i)
  if char:match "[A-Za-z]" then
    vim.keymap.set("n", "dm" .. char, ":delmarks " .. char .. "<CR>", { silent = true })
  end
end

-- for i = string.byte "A", string.byte "I" do
--   vim.keymap.set("n", "<leader>" .. (i - 64), "`" .. string.char(i))
-- end

-- quickfix and loclist
vim.keymap.set("n", "<leader>c", utils.toggle_quickfix, { silent = true })
vim.keymap.set("n", "<leader>l", utils.toggle_loclist, { silent = true })

-- fold
vim.keymap.set("n", "zV", ":normal zMzvzz<CR>", { silent = true })
vim.keymap.set("n", "[of", ":setlocal foldmethod=indent<cr>")
vim.keymap.set("n", "]of", ":setlocal foldmethod=expr<cr>")
vim.keymap.set("n", "yof", function()
  if vim.opt_local.foldmethod:get() == "indent" then
    vim.opt_local.foldmethod = "expr"
    vim.cmd 'echo ":setlocal foldmethod=expr"'
  else
    vim.opt_local.foldmethod = "indent"
    vim.cmd 'echo ":setlocal foldmethod=indent"'
  end
end)

-- move screen
vim.keymap.set("n", "zZ", "zszH", { silent = true })

-- tag
vim.keymap.set("n", "<c-]>]", "g<c-]>", { remap = true })
vim.keymap.set("n", "<c-]><c-]>", "g<c-]>", { remap = true })

vim.keymap.set("n", "<c-]>v", ":vsplit<cr>g<c-]>", { remap = true })
vim.keymap.set("n", "<c-]><c-v>", ":vsplit<cr>g<c-]>", { remap = true })

vim.keymap.set("n", "<c-]>s", "<c-w>g<c-]>", { remap = true })
vim.keymap.set("n", "<c-]><c-s>", "<c-w>g<c-]>", { remap = true })

vim.keymap.set("n", "<c-]>t", "<c-w>g<c-]><c-w>T", { remap = true })
vim.keymap.set("n", "<c-]><c-t>", "<c-w>g<c-]><c-w>T", { remap = true })

vim.keymap.set("n", "<c-]>p", "<c-w>g}", { remap = true })
vim.keymap.set("n", "<c-]><c-p>", "<c-w>g}", { remap = true })

-- tab
vim.keymap.set("n", "]<tab>", "gt")
vim.keymap.set("n", "[<tab>", "gT")
vim.keymap.set("t", "]<tab>", "<c-\\><c-n>Ggt")
vim.keymap.set("t", "[<tab>", "<c-\\><c-n>GgT")
vim.keymap.set("n", "<leader>t", ":tabnew<cr>", { silent = true })
vim.keymap.set("n", "<leader>x", utils.tabclose, { silent = true })

-- keep center
-- vim.keymap.set('n', [[']], [["'" . nr2char(getchar()) . "zt"]], { expr = true })
-- vim.keymap.set('n', [[`]], [["`" . nr2char(getchar()) . "zt"]], { expr = true })

-- join and break line
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "S", "i<CR><ESC>l", { silent = true })

-- registers
-- vim.keymap.set('v', 'p', '"_dP') -- Don't copy the replaced text after pasting in visual mode
vim.keymap.set("", "gp", '"0p')
vim.keymap.set("", "gP", '"0P')
vim.keymap.set("", "<leader>y", '"*y')
vim.keymap.set("", "<leader>p", '"*p')

-- resize panes
vim.keymap.set("n", "<leader>w<Up>", ":10winc +<CR>", { silent = true })
vim.keymap.set("n", "<leader>w<Down>", ":10winc -<CR>", { silent = true })
vim.keymap.set("n", "<leader>w<Left>", ":10winc <<CR>", { silent = true })
vim.keymap.set("n", "<leader>w<Right>", ":10winc ><CR>", { silent = true })

-- File
vim.keymap.set("n", "<leader>fc", [[:saveas <C-R>=expand("%")<CR>]], { silent = true, desc = "File > Save As" })
vim.keymap.set(
  "n",
  "<leader>fyy",
  [[:let @+=expand("%:.") | echo @+<CR>]],
  { silent = true, desc = "File > Copy > Relative File Path" }
)
vim.keymap.set(
  "n",
  "<leader>fyY",
  [[:let @+=expand("%:p") | echo @+<CR>]],
  { silent = true, desc = "File > Copy > Full File Path" }
)
vim.keymap.set("n", "<leader>fyf", [[ggVG"*y<c-o>]], { silent = true, desc = "File > Copy > File Content" })
vim.keymap.set(
  "n",
  "<leader>fyn",
  [[:let @+=expand("%:t:r") | echo @+<CR>]],
  { silent = true, desc = "File > Copy > File Name without Extension" }
)
vim.keymap.set(
  "n",
  "<leader>fyN",
  [[:let @+=expand("%:t") | echo @+<CR>]],
  { silent = true, desc = "File > Copy > File Name with Extension" }
)
vim.keymap.set(
  "n",
  "<leader>fyl",
  [[:let @+=expand("%:.").":".line(".") | echo @+<CR>]],
  { silent = true, desc = "File > Copy > Relative File Path with Line Number" }
)
vim.keymap.set(
  "n",
  "<leader>fyd",
  [[:let @+=expand("%:.:h") | echo @+<CR>]],
  { silent = true, desc = "File > Copy > Directory Path" }
)

-- open files
vim.keymap.set("n", "<space>gn", ":vert botright 80 new $CLOUD/Notes<CR>", { silent = true })
vim.keymap.set("n", "<space>gt", ":botright 30 new $CLOUD/Notes/todo.md<CR>", { silent = true })
vim.keymap.set("n", "<space>gh", ":vnew local.http<cr>", { silent = true })
