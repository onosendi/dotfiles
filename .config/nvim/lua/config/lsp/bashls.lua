vim.lsp.config.bashls = {
  cmd = { "bash-language-server", "start"  },
  filetypes = { "sh", "bash", "zsh" },
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
}

vim.lsp.enable("bashls")
