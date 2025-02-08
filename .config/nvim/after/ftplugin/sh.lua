-- luacheck: ignore 631
-- <cmd>set splitright | vnew | set filetype=sh | setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile | read !sh #<cr>
buf_map("n", "`<cr>", "<cmd>R !sh % | set filetype=sh<cr>")
