local M = {}

M.diagnostics = {
  Error = " ",
  Warn = " ",
  Hint = " ",
  Info = " ",
}

M.git_signs = {
  added = " ",
  modified = " ",
  removed = " ",
}

M.symbol_kinds = {
  Array = "󰅪",
  Class = "",
  Color = "󰏘",
  Constant = "",
  Constructor = "",
  Enum = "",
  EnumMember = "",
  Event = "",
  Field = "󰜢",
  File = "󰈙",
  Folder = "󰉋",
  Function = "ƒ",
  Interface = "",
  Keyword = "󰌋",
  Method = "ƒ",
  Module = "",
  Operator = "󰆕",
  Property = "󰜢",
  Reference = "",
  Snippet = "",
  Struct = "",
  Text = "",
  TypeParameter = "",
  Unit = "",
  Value = "",
  Variable = "󰀫",
}

M.misc = {
  home = "",
  config = "",
  project = "",
  git_branch = "󰘬",
  tick = "",
  search = "",
  keyboard = "",
  refresh = "",
  sign_out = "",
  custom_default = "",
}

return M
