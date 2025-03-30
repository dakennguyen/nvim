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

    ---[[Code required to activate autocompletion and trigger it on each keypress
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client:supports_method "textDocument/completion" then
      client.server_capabilities.completionProvider.triggerCharacters = vim.split("qwertyuiopasdfghjklzxcvbnm. ", "")
      vim.api.nvim_create_autocmd({ "TextChangedI" }, {
        buffer = args.buf,
        callback = function() vim.lsp.completion.get() end,
      })
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end
    ---]]

    ---[[Code required to add documentation popup for an item
    local _, cancel_prev = nil, function() end
    vim.api.nvim_create_autocmd("CompleteChanged", {
      buffer = args.buf,
      callback = function()
        cancel_prev()
        local info = vim.fn.complete_info { "selected" }
        local completionItem = vim.tbl_get(vim.v.completed_item, "user_data", "nvim", "lsp", "completion_item")
        if nil == completionItem then return end
        _, cancel_prev = vim.lsp.buf_request(
          args.buf,
          vim.lsp.protocol.Methods.completionItem_resolve,
          completionItem,
          function(_, item, _)
            if not item then return end
            local docs = (item.documentation or {}).value
            local win = vim.api.nvim__complete_set(info["selected"], { info = docs })
            if win.winid and vim.api.nvim_win_is_valid(win.winid) then
              vim.treesitter.start(win.bufnr, "markdown")
              vim.wo[win.winid].conceallevel = 3
            end
          end
        )
      end,
    })
    ---]]
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
