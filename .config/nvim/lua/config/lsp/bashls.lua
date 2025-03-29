vim.lsp.config.bashls = {
  cmd = { "bash-language-server", "start"  },
  filetypes = { "sh", "bash", "zsh" },
}

vim.lsp.enable("bashls")
