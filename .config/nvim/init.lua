require("config.keymaps")
require("config.options")
require("config.lazy")
require("config.ui")
require("lazy").setup("plugins", {
  change_detection = {
    notify = false,
  },
})

-- Load all LSP's in "lua/config/lsp"
local lsp_path = vim.fn.stdpath("config") .. "/lua/config/lsp"

-- First, explicitly load the global configuration
require("config.lsp.global")

-- Then load all other LSP configs
for _, file in ipairs(vim.fn.readdir(lsp_path)) do
  if file:match("%.lua$") and file ~= "global.lua" then
    local module_name = "config.lsp." .. file:gsub("%.lua$", "")
    require(module_name)
  end
end
