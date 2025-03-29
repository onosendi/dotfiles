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
for _, file in ipairs(vim.fn.readdir(lsp_path)) do
  if file:match("%.lua$") then
    local module_name = "config.lsp." .. file:gsub("%.lua$", "")
    require(module_name)
  end
end
