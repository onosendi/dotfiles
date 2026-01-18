vim.lsp.config.yaml = {
  cmd = { "yaml-language-server", "--stdio" },
  filetypes = { "yaml", "yml" },
  root_markers = { ".git" },
}

vim.lsp.enable("yaml")
