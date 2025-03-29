vim.lsp.config.luals = {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { ".luarc.json", ".luarc.jsonc" },
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
}

vim.lsp.enable("luals")
