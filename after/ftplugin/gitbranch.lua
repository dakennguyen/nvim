local opts = { buffer = true }
vim.keymap.set("n", ".", ":Git  <c-r><c-a><s-left><left>", opts)
vim.keymap.set("n", "cb<space>", ":Git branch  <c-r><c-a><s-left><left>", opts)
vim.keymap.set("n", "co<space>", ":Git checkout  <c-r><c-a><s-left><left>", opts)
vim.keymap.set("n", "cot", ":Git checkout --track <c-r><c-a><cr>", opts)
vim.keymap.set("n", "A", ":Git checkout -b  <c-r><c-a><s-left><left>", opts)
vim.keymap.set("n", "D", ":Git branch  <c-r><c-a><s-left><left>", opts)
vim.keymap.set("n", "R", ":Git branch -m <c-r><c-a> <c-r><c-a>", opts)
vim.keymap.set("n", "rb", ":Git rebase <c-r><c-a><cr>", opts)
vim.keymap.set("n", "mf", ":Git merge <c-r><c-a><cr>", opts)
vim.keymap.set(
  "n",
  "gl",
  ":Git log -n 5000 --oneline --date=short --pretty=format:'%h%d %s (%an)' <c-r><c-a><cr>",
  opts
)
