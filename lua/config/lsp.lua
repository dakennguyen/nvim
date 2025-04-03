-- Preference
-- ======================================
vim.diagnostic.config {
  signs = false,
}

-- Servers config
-- ======================================

_G.augroup("my.lsp", {
  event = "LspAttach",
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client:supports_method "textDocument/foldingRange" then
      local win = vim.api.nvim_get_current_win()
      vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
      vim.wo[win][0].foldtext = ""
    end

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

local lsp_servers_path = vim.fn.stdpath "config" .. "/lua/config/lsp-servers.lua"
if vim.uv.fs_stat(lsp_servers_path) then
  require "config.lsp-servers"
else
  vim.notify("Create " .. lsp_servers_path .. " to enable LSP servers", vim.log.levels.WARN)
end
