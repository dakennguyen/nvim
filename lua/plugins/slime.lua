vim.pack.add { "https://github.com/jpalardy/vim-slime" }

vim.g.slime_target = "tmux"
vim.g.slime_default_config = {
  socket_name = vim.fn.get(vim.split(vim.env.TMUX or "", ","), 0),
  target_pane = ":.2",
}

vim.keymap.set("n", "<c-c><c-l>", "<cmd>SlimeSendCurrentLine<cr>")
