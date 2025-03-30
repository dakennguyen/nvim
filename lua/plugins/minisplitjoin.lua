return {
  "echasnovski/mini.splitjoin",
  keys = { "<space><space>", "gS", "gJ" },
  opts = function()
    local gen_hook = require("mini.splitjoin").gen_hook
    local curly = { brackets = { "%b{}" } }

    local del_comma_curly = gen_hook.del_trailing_separator(curly)
    local pad_curly = gen_hook.pad_brackets(curly)

    return {
      mappings = {
        toggle = "<space><space>",
        split = "gS",
        join = "gJ",
      },
      join = {
        hooks_post = { del_comma_curly, pad_curly },
      },
    }
  end,
}
