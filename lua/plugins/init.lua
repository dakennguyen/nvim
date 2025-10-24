require("themes").setup()

local plugin_path = "plugins"
local files = vim.fn.globpath(vim.fn.stdpath "config" .. "/lua/" .. plugin_path, "*.lua", false, true)

for _, file in ipairs(files) do
  local module_name = file:match ".*/(.*)%.lua$"
  if module_name ~= "init" then require(plugin_path .. "." .. module_name) end
end
