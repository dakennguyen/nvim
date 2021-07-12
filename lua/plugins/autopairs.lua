local npairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')
local endwise = require('nvim-autopairs.ts-rule').endwise

npairs.setup{
  ignored_next_char = "[%w%:%.]"
}

npairs.add_rules({
  endwise('do$',         'end', 'ruby', nil),
  endwise('begin$',      'end', 'ruby', nil),
  endwise('def%s.+$',    'end', 'ruby', nil),
  endwise('module%s.+$', 'end', 'ruby', nil),
  endwise('class%s.+$',  'end', 'ruby', nil),
  -- endwise('if%s.+$',     'end', 'ruby', nil),
  -- endwise('unless%s.+$', 'end', 'ruby', nil),
  -- endwise('case%s.+$',   'end', 'ruby', nil),
  -- endwise('while%s.+$',  'end', 'ruby', nil),
  -- endwise('until%s.+$',  'end', 'ruby', nil),
  Rule('if%s.+%s$',     'end', "ruby")
    :use_regex(true),
  Rule('unless%s.+%s$', 'end', "ruby")
    :use_regex(true),
  Rule('case%s.+%s$',   'end', "ruby")
    :use_regex(true),
  Rule('while%s.+%s$',  'end', "ruby")
    :use_regex(true),
  Rule('until%s.+%s$',  'end', "ruby")
    :use_regex(true),
})

_G.completion_confirm=function()
  if vim.fn.pumvisible() == 0 or ((vim.call('complete_info', {'selected' }).selected or -1) == -1)
  then
    return npairs.autopairs_cr()
  else
    return vim.fn["compe#confirm"]('<cr>')
  end
end

map('i' , '<CR>','v:lua.completion_confirm()', { silent = true, expr = true })
