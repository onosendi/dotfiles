vim.lsp.config.pyright = {
  cmd = { "pyright-langserver", "--stdio"  },
  filetypes = { "python" },
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
}

vim.lsp.enable("pyright")
