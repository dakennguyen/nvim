local id = vim.api.nvim_create_augroup("startup", {
  clear = false,
})

local persistbuffer = function(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  vim.fn.setbufvar(bufnr, "bufpersist", 1)
end

vim.api.nvim_create_autocmd({ "BufRead" }, {
  group = id,
  pattern = { "*" },
  callback = function()
    vim.api.nvim_create_autocmd({ "InsertEnter", "BufModifiedSet" }, {
      buffer = 0,
      once = true,
      callback = function() persistbuffer() end,
    })
  end,
})

vim.api.nvim_create_user_command("DeleteUnusedBuffers", function()
  local curbufnr = vim.api.nvim_get_current_buf()
  local buflist = vim.api.nvim_list_bufs()
  for _, bufnr in ipairs(buflist) do
    if
      vim.bo[bufnr].buflisted
      and bufnr ~= curbufnr
      and vim.bo[bufnr].buftype ~= "terminal"
      and (vim.fn.getbufvar(bufnr, "bufpersist") ~= 1)
    then
      vim.cmd("bd " .. tostring(bufnr))
    end
  end
end, { desc = "Delete unused buffers" })
