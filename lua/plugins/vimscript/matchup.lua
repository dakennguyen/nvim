return {
  "andymass/vim-matchup",
  init = _G.lazy_load "vim-matchup",
  config = function()
    vim.g.matchup_matchparen_offscreen = {}

    _G.highlight("MatchParen", { style = "italic" })
  end,
}
