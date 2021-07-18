require("toggleterm").setup{}
map('n', '`', ':ToggleTerm size=50<CR>')
map('t', '`', '<C-\\><C-N>:ToggleTerm<CR>')
map('t', '`', '<C-\\><C-N>')

local Terminal  = require('toggleterm.terminal').Terminal

-- Lazygit
local lazygit = Terminal:new({
  cmd = "lazygit",
  hidden = true,
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "double",
  },
})

function _lazygit_toggle()
  lazygit:toggle()
end

map("n", "<space>gg", "<cmd>lua _lazygit_toggle()<CR>", { silent = true })
