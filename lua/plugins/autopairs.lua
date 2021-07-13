local npairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')
local endwise = require('nvim-autopairs.ts-rule').endwise

npairs.setup{
  ignored_next_char = "[%w%:%.]"
}

npairs.add_rules({
  endwise('%sdo$',         'end', 'ruby', nil),
  endwise('%sdo%s|.*|$',   'end', 'ruby', nil),
  endwise('begin$',        'end', 'ruby', nil),
  endwise('def%s.+$',      'end', 'ruby', nil),
  endwise('module%s.+$',   'end', 'ruby', nil),
  endwise('class%s.+$',    'end', 'ruby', nil),
  Rule('[%s=]%sif%s.',     'end', "ruby")
    :use_regex(true)
    :end_wise(),
  Rule('[%s=]%sunless%s.', 'end', "ruby")
    :use_regex(true)
    :end_wise(),
  Rule('[%s=]%scase%s.',   'end', "ruby")
    :use_regex(true)
    :end_wise(),
  Rule('[%s=]%swhile%s.',  'end', "ruby")
    :use_regex(true)
    :end_wise(),
  Rule('[%s=]%suntil%s.',  'end', "ruby")
    :use_regex(true)
    :end_wise(),
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
