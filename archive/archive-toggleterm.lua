-- require("toggleterm").setup{}
-- map('n', '<leader>z', ':ToggleTerm<CR>')
-- map('t', '<leader>z', '<C-\\><C-N>:ToggleTerm<CR>')
-- map('t', '`', '<C-\\><C-N>')

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

-- Spotify
local spotify = Terminal:new({
  cmd = "spt",
  hidden = true,
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "double",
  },
})

function _spotify_toggle()
  spotify:toggle()
end

map("n", "<space>gg", "<cmd>lua _lazygit_toggle()<CR>", { silent = true })
map("n", "<space>gm", "<cmd>lua _spotify_toggle()<CR>", { silent = true })
