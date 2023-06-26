vim.cmd [[
  silent! unmap <buffer> mp
  silent! unmap <buffer> <c-l>
]]

buf_map("n", "?", ":help netrw-quickmap<CR>")
buf_map("n", "<leader>0", "<Plug>NetrwRefresh", { remap = true })
buf_map("v", "mf", ":norm mf<cr>")

buf_map(
  "n",
  "<space>gn",
  [[:nnoremap <lt>silent> <lt>space>gn :vert botright 80 new <c-r><c-f><lt>cr><cr>]],
  { remap = true, silent = true }
)
buf_map(
  "n",
  "<space>gh",
  [[:nnoremap <lt>silent> <lt>space>gh :vert new <c-r><c-f><lt>cr><cr>]],
  { remap = true, silent = true }
)
buf_map(
  "n",
  "<space>gr",
  [[:nnoremap <lt>silent> <lt>space>gr :tabnew <c-r><c-f><lt>cr><cr>]],
  { remap = true, silent = true }
)
buf_map("n", "<leader>fp", [[:!open -a 'google chrome' '<c-r><c-f>'<cr>]], { remap = true, silent = true })
