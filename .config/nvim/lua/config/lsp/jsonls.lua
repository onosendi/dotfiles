vim.lsp.config.jsonls = {
  cmd = { "vscode-json-language-server", "--stdio" },
  filetypes = { "json", "jsonc" },
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
}

vim.lsp.enable("jsonls")
