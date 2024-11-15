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

    -- cmp
    -- ======================================
    local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

    -- Servers config
    -- ======================================

    local nvim_lsp = require "lspconfig"

    local on_attach = function(client, bufnr)
      --Enable completion triggered by <c-x><c-o>
      -- vim.api.nvim_set_option_value("omnifunc", "v:lua.vim.lsp.omnifunc", { buf = bufnr })

      -- Mappings.
      local opts = { buffer = bufnr, silent = true }

      map("n", "gdd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
      map("n", "gdv", [[<Cmd>vs | lua vim.lsp.buf.definition()<CR>]], opts)
      map("n", "gds", [[<Cmd>split | lua vim.lsp.buf.definition()<CR>]], opts)
      map("n", "gdt", [[<Cmd>tab split | lua vim.lsp.buf.definition()<CR>]], opts)
      map("n", "gh", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
      map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
      -- map("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
      -- map("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
      -- map("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
      map("n", "<space>li", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
      map("n", "<space>ld", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
      map("n", "<space>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
      map("n", "<space>lt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
      map("n", "<space>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
      map("n", "<space>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
      map("n", "<space>ll", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
      map("n", "<leader>l", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

      -- Set some keybinds conditional on server capabilities
      if
        client.server_capabilities.documentFormattingProvider
        or client.server_capabilities.documentRangeFormattingProvider
      then
        map("n", "<space>lf", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", opts)
      end

      -- vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]
    end

    local lsp_flags = {
      debounce_text_changes = 150,
    }

    -- https://clangd.llvm.org/installation
    nvim_lsp.clangd.setup {
      capabilities = capabilities,
      on_attach = on_attach,
      flags = lsp_flags,
    }
  end,
}
