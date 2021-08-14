require('auto-session').setup{
  auto_save_enabled = true,
  auto_restore_enabled = true,
}

map("n", "<space>ss", [[<cmd>SaveSession<CR>]], { silent = true })
map("n", "<space>sl", [[<cmd>RestoreSession<CR>]], { silent = true })
map("n", "<space>sd", [[<cmd>DeleteSession<CR>]], { silent = true })
