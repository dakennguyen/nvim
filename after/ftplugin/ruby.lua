vim.cmd [[
  iabbrev <buffer> bb byebug<esc>
]]

vim.b["start"] = vim.fn.executable "pry" == 1 and "pry -r %:p:S" or "irb -r %:p:S"
if vim.fn.expand("%"):match "_scripts/.*.rb$" then
  vim.b["dispatch"] = "bundle exec rails runner %:S"
else
  vim.b["dispatch"] = "ruby %"
end
