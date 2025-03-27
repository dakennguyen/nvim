-- Preference
-- ======================================
local signs = require("icons").diagnostics

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config {
  virtual_text = false,
  signs = false,
  underline = true,
  update_in_insert = false,
}

-- Servers config
-- ======================================

_G.augroup("my.lsp", {
  event = "LspAttach",
  callback = function(args)
    local opts = { buffer = args.buf, silent = true }

    map("n", "gdd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    map("n", "gdv", [[<Cmd>vs | lua vim.lsp.buf.definition()<CR>]], opts)
    map("n", "gds", [[<Cmd>split | lua vim.lsp.buf.definition()<CR>]], opts)
    map("n", "gdt", [[<Cmd>tab split | lua vim.lsp.buf.definition()<CR>]], opts)
    map("n", "gh", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
    map("n", "gry", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    map("n", "<c-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    map("n", "<space>ld", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    map("n", "<space>ll", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    map("n", "<leader>l", function() require("utils").toggle_loclist { setloclist = true } end, opts)
    map("n", "<space>lf", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", opts)
  end,
})

vim.lsp.config("*", {
  root_markers = { ".git" },
})

vim.lsp.enable {
  "clangd",
  "docker_compose_language_service",
  "dockerls",
  "efm",
  "gopls",
  "jdtls",
  "jsonls",
  "intelephense",
  "lua_ls",
  "pyright",
  "r_language_server",
  "solargraph",
  "ts_ls",
}
