require("themes").setup()

vim.pack.add { "https://github.com/nvim-mini/mini.icons" }
require("mini.icons").setup()

local config_root = vim.fn.stdpath "config" .. "/lua/"
local function load_files(sub_dir)
  local dir = "plugins" .. (sub_dir and "/" .. sub_dir or "")
  local prefix = "plugins" .. (sub_dir and "." .. sub_dir or "")
  local files = vim.fn.globpath(config_root .. dir, "*.lua", false, true)

  for _, file in ipairs(files) do
    local module_name = file:match ".*/(.*)%.lua$"
    if module_name and module_name ~= "init" then require(prefix .. "." .. module_name) end
  end
end

load_files "common"
if vim.g.vscode == nil then load_files() end
