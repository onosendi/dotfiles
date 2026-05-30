local function get_ruff_cmd()
  local root = vim.fn.getcwd()
  local venv_ruff = root .. "/.venv/bin/ruff"

  if vim.fn.executable(venv_ruff) == 1 then
    return { venv_ruff, "server" }
  end

  return { "ruff", "server" }
end

vim.lsp.config.ruff = {
  cmd = get_ruff_cmd(),
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "ruff.toml", ".ruff.toml", ".git" },
}

vim.lsp.enable("ruff")
