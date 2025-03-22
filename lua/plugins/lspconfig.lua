return {
  "neovim/nvim-lspconfig",
  init = _G.lazy_load "nvim-lspconfig",
  config = function()
    -- Preference
    -- ======================================
    local signs = require("icons").diagnostics

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
      lintCommand = "luacheck --codes --no-color --quiet -",
      lintStdin = true,
      lintFormats = { "%.%#:%l:%c: (%t%n) %m" },
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

    -- Servers config
    -- ======================================

    -- cmp
    local capabilities = require("blink.cmp").get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities())

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
      map({ "n", "i" }, "<c-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
      -- map("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
      -- map("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
      -- map("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
      map("n", "<space>ld", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
      map("n", "<space>ll", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
      map("n", "<leader>l", function() require("utils").toggle_loclist { setloclist = true } end, opts)
      map("n", "<space>lf", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", opts)
    end

    local lsp_flags = {
      debounce_text_changes = 150,
    }

    local lsps = {
      "clangd", -- https://clangd.llvm.org/installation
      "gopls", -- go install golang.org/x/tools/gopls@latest
      "jdtls", -- https://download.eclipse.org/jdtls/snapshots/?d
      "intelephense", -- npm install -g intelephense
      "docker_compose_language_service", -- npm install -g @microsoft/compose-language-service
      "dockerls", -- npm install -g dockerfile-language-server-nodejs
      "pyright", -- pip install pyright
      "r_language_server", -- install.packages("languageserver")
      "ts_ls", -- npm install -g typescript typescript-language-server
      "jsonls", -- npm install -g vscode-langservers-extracted
    }

    for _, lsp in pairs(lsps) do
      nvim_lsp[lsp].setup {
        capabilities = capabilities,
        on_attach = on_attach,
        flags = lsp_flags,
      }
    end

    -- `gem install solargraph`
    nvim_lsp.solargraph.setup {
      capabilities = capabilities,
      on_attach = on_attach,
      flags = lsp_flags,
      settings = {
        solargraph = {
          useBundler = true,
          formatting = true,
          autoformat = true,
        },
      },
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
      on_attach = on_attach,
      -- root_dir = function()
      --   if not eslint_config_exists() then
      --     return nil
      --   end
      --   return vim.fn.getcwd()
      -- end,
      settings = {
        rootMarkers = { "README.md", ".git/" },
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
