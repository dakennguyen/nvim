return {
  "neovim/nvim-lspconfig",
  init = _G.lazy_load "nvim-lspconfig",
  config = function()
    -- Preference
    -- ======================================
    local signs = { Error = " ", Warn = " ", Info = " ", Hint = " " }
    --
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = false,
      signs = false,
      underline = true,
      update_in_insert = false,
    })

    -- Servers config
    -- ======================================

    -- cmp
    local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

    local nvim_lsp = require "lspconfig"

    local on_attach = function(_, bufnr)
      local opts = { buffer = bufnr, silent = true }

      map("n", "gdd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
      map("n", "gdv", [[<Cmd>vs | lua vim.lsp.buf.definition()<CR>]], opts)
      map("n", "gds", [[<Cmd>split | lua vim.lsp.buf.definition()<CR>]], opts)
      map("n", "gdt", [[<Cmd>tab split | lua vim.lsp.buf.definition()<CR>]], opts)
      map("n", "gh", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
      map("n", "grn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
      map("n", "gra", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
      map("n", "grr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
      map("n", "gri", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
      map("n", "gry", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
      map("n", "grs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
      map("i", "<c-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
      -- map("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
      -- map("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
      -- map("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
      map("n", "<space>ld", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
      map("n", "<space>ll", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
      map("n", "<leader>l", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
      map("n", "<space>lf", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", opts)
    end

    local lsp_flags = {
      debounce_text_changes = 150,
    }

    local lsps = {
      "clangd", -- https://clangd.llvm.org/installation
    }

    for _, lsp in pairs(lsps) do
      nvim_lsp[lsp].setup {
        capabilities = capabilities,
        on_attach = on_attach,
        flags = lsp_flags,
      }
    end
  end,
}
