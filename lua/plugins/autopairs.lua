local npairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')

npairs.setup{
  ignored_next_char = "[%w%:%.]"
}

npairs.add_rules({
  Rule('do$', 'end', "ruby")
    :use_regex(true),
  Rule('begin$', 'end', "ruby")
    :use_regex(true),
  Rule('module%s[%w_]+%s$', 'end', "ruby")
    :use_regex(true),
  Rule('class%s[%w_]+%s$', 'end', "ruby")
    :use_regex(true),
  Rule('def%s[%w_]+%s$', 'end', "ruby")
    :use_regex(true),
  Rule('if%s[%w_]+%s$', 'end', "ruby")
    :use_regex(true),
  Rule('unless%s[%w_]+%s$', 'end', "ruby")
    :use_regex(true),
  Rule('case%s[%w_]+%s$', 'end', "ruby")
    :use_regex(true),
  Rule('while%s[%w_]+%s$', 'end', "ruby")
    :use_regex(true),
  Rule('until%s[%w_]+%s$', 'end', "ruby")
    :use_regex(true),
})
