return {
  "echasnovski/mini.splitjoin",
  keys = { "]j", "[j" },
  opts = function()
    local gen_hook = require("mini.splitjoin").gen_hook
    local curly = { brackets = { "%b{}" } }

    local del_comma_curly = gen_hook.del_trailing_separator(curly)
    local pad_curly = gen_hook.pad_brackets(curly)

    return {
      mappings = {
        split = "]j",
        join = "[j",
      },
      join = {
        hooks_post = { del_comma_curly, pad_curly },
      },
    }
  end,
}
