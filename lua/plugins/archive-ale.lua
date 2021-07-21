vim.g.ale_linters_explicit = 1
vim.g.ale_lint_on_text_changed = 'never'
vim.g.ale_lint_on_insert_leave = 0
vim.g.ale_lint_on_enter = 0
vim.g.ale_fix_on_save = 1

vim.g.ale_set_loclist = 0
vim.g.ale_set_quickfix = 1
vim.g.ale_open_list = 0

vim.g.ale_linters = {
  javascript = {'eslint', 'prettier'},
}
vim.g.ale_fixers = {
  javascript = {'prettier'},
}
