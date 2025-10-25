-- luacheck: ignore 631
-- <cmd>set splitright | vnew | set filetype=sh | setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile | read !sh #<cr>
vim.keymap.set("n", "`<cr>", "<cmd>R !sh % | set filetype=sh<cr>", { buffer = true })
