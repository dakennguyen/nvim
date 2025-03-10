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

    -- Linters
    -- ======================================

    local prettier = {
      formatCommand = "prettier --stdin-filepath ${INPUT}",
      formatStdin = true,
    }

    local eslint = {
      lintCommand = "eslint_d -f visualstudio --stdin --stdin-filename ${INPUT}",
      lintStdin = true,
      lintFormats = { "%f(%l,%c): %tarning %m", "%f(%l,%c): %rror %m" },
      lintIgnoreExitCode = true,
      formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
      formatStdin = true,
    }

    local golangci_lint = {
      lintCommand = "golangci-lint run ${INPUT}",
      lintStdin = true,
    }

    local flake8 = {
      lintCommand = "flake8 ${INPUT}",
      lintStdin = true,
    }

    local black = {
      formatCommand = "black --quiet -",
      formatStdin = true,
    }

    local luacheck = {
      lintCommand = "luacheck --filename ${INPUT} --formatter plain -",
      lintStdin = true,
    }

    local stylua = {
      formatCommand = "stylua --search-parent-directories -",
      formatStdin = true,
    }

    -- local function eslint_config_exists()
    --   local eslintrc = vim.fn.glob(".eslintrc*", 0, 1)

    --   if not vim.tbl_isempty(eslintrc) then
    --     return true
    --   end

    --   if vim.fn.filereadable("package.json") then
    --     if vim.fn.json_decode(vim.fn.readfile("package.json"))["eslintConfig"] then
    --       return true
    --     end
    --   end

    --   return false
    -- end

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

    -- `gem install solargraph`
    nvim_lsp.solargraph.setup {
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = true
        on_attach(client, bufnr)
      end,
      flags = lsp_flags,
      settings = {
        solargraph = {
          useBundler = true,
          formatting = true,
          autoformat = true,
        },
      },
    }

    -- https://clangd.llvm.org/installation
    nvim_lsp.clangd.setup {
      capabilities = capabilities,
      on_attach = on_attach,
      flags = lsp_flags,
    }

    -- go install golang.org/x/tools/gopls@latest
    -- go install github.com/go-delve/delve/cmd/dlv@latest
    nvim_lsp.gopls.setup {
      capabilities = capabilities,
      on_attach = on_attach,
      flags = lsp_flags,
    }

    -- https://download.eclipse.org/jdtls/snapshots/?d
    -- Link bin folder to PATH
    nvim_lsp.jdtls.setup {
      capabilities = capabilities,
      on_attach = on_attach,
      flags = lsp_flags,
    }

    -- npm install -g @microsoft/compose-language-service
    nvim_lsp.docker_compose_language_service.setup {
      capabilities = capabilities,
      on_attach = on_attach,
      flags = lsp_flags,
    }

    -- npm install -g dockerfile-language-server-nodejs
    nvim_lsp.dockerls.setup {
      capabilities = capabilities,
      on_attach = on_attach,
      flags = lsp_flags,
    }

    -- pip install pyright
    nvim_lsp.pyright.setup {
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = true
        on_attach(client, bufnr)
      end,
      flags = lsp_flags,
    }

    -- install.packages("languageserver")
    nvim_lsp.r_language_server.setup {
      capabilities = capabilities,
      on_attach = on_attach,
      flags = lsp_flags,
    }

    -- `npm install -g typescript`
    -- `npm install -g typescript-language-server`
    nvim_lsp.ts_ls.setup {
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        if client.config.flags then client.config.flags.allow_incremental_sync = true end
        client.server_capabilities.documentFormattingProvider = false
        on_attach(client, bufnr)
      end,
      flags = lsp_flags,
    }

    -- npm i -g vscode-langservers-extracted
    nvim_lsp.jsonls.setup {
      capabilities = capabilities,
      on_attach = on_attach,
      flags = lsp_flags,
    }

    -- git clone https://github.com/LuaLS/lua-language-server
    -- ./make.sh
    nvim_lsp.lua_ls.setup {
      capabilities = capabilities,
      on_attach = on_attach,
      flags = lsp_flags,
      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = "LuaJIT",
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { "vim" },
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
            enable = false,
          },
        },
      },
    }

    -- `npm install -g eslint_d`
    -- `npm install -g prettier`
    -- `brew install efm-langserver`
    -- `brew install stylua`
    -- `brew install luacheck`
    -- `go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest`
    -- `pip install flake8`
    nvim_lsp.efm.setup {
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = true
        -- client.resolved_capabilities.goto_definition = false
        on_attach(client, bufnr)
      end,
      -- root_dir = function()
      --   if not eslint_config_exists() then
      --     return nil
      --   end
      --   return vim.fn.getcwd()
      -- end,
      settings = {
        rootMarkers = { "README.md", ".gitignore" },
        languages = {
          javascript = { eslint },
          javascriptreact = { eslint },
          typescript = { eslint },
          typescriptreact = { eslint },
          json = { prettier },
          go = { golangci_lint },
          python = { flake8, black },
          lua = { luacheck, stylua },
        },
      },
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "json", "go", "python", "lua" },
      init_options = { documentFormatting = true, codeAction = true },
    }
  end,
}
