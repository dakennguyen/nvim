-- Preference
-- ======================================
local icons = require "icons"
vim.diagnostic.config {
  signs = false,
  status = {
    text = {
      [vim.diagnostic.severity.ERROR] = icons.diagnostics["Error"] .. " ",
      [vim.diagnostic.severity.WARN] = icons.diagnostics["Warn"] .. " ",
      [vim.diagnostic.severity.INFO] = icons.diagnostics["Info"] .. " ",
      [vim.diagnostic.severity.HINT] = icons.diagnostics["Hint"],
    },
  },
}

-- Servers config
-- ======================================

_G.augroup("my.lsp", {
  event = "LspAttach",
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client:supports_method "textDocument/foldingRange" then
      local win = vim.api.nvim_get_current_win()
      vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
      vim.wo[win][0].foldmethod = "expr"
      vim.wo[win][0].foldtext = ""
    end

    local opts = { buffer = args.buf, silent = true }
    vim.keymap.set("n", "gdd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gdv", function()
      vim.cmd.vsplit()
      vim.lsp.buf.definition()
    end, opts)
    vim.keymap.set("n", "gds", function()
      vim.cmd.split()
      vim.lsp.buf.definition()
    end, opts)
    vim.keymap.set("n", "gdt", function()
      vim.cmd "tab split"
      vim.lsp.buf.definition()
    end, opts)
    vim.keymap.set("n", "gh", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gry", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<c-s>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<space>ld", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "<space>ll", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "<leader>l", function() require("utils").toggle_loclist { setloclist = true } end, opts)
    vim.keymap.set("n", "<space>lf", function() vim.lsp.buf.format { async = true } end, opts)
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
