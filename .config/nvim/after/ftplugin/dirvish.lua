buf_map("n", "<leader>a", "gq", { remap = true })

local opts = { silent = true, nowait = true }
buf_map("n", "t", ":call dirvish#open('tabedit', 0)<CR>", opts)
buf_map("x", "t", ":call dirvish#open('tabedit', 0)<CR>", opts)
buf_map("n", "o", ":call dirvish#open('split', 0)<CR>", opts)
buf_map("n", "v", ":call dirvish#open('vsplit', 0)<CR>", opts)

buf_map("n", "%", "<Plug>(dovish_create_file)", opts)
buf_map("n", "d", "<Plug>(dovish_create_directory)", opts)
buf_map("n", "D", "<Plug>(dovish_delete)", opts)
buf_map("n", "R", "<Plug>(dovish_rename)", opts)
buf_map("n", "yy", "<Plug>(dovish_yank)", opts)
buf_map("x", "y", "<Plug>(dovish_yank)", opts)
buf_map("n", "mc", "<Plug>(dovish_copy)", opts)
buf_map("n", "mm", "<Plug>(dovish_move)", opts)

buf_map("n", "<leader>fp", [[:!open -a 'arc' '<c-r><c-f>'<cr>]], { remap = true, silent = true })

buf_map("n", "<space>ff", ":Files %<cr>", opts)
