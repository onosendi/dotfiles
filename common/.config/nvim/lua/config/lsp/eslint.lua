local utils = require('utils');

local function get_workspace_folder()
  local root = vim.fn.getcwd()
  return {
    name = vim.fn.fnamemodify(root, ":t"),
    uri = vim.uri_from_fname(root),
  }
end

vim.lsp.config.eslint = {
  cmd = { "vscode-eslint-language-server", "--stdio" },
  filetypes = { "javascript", "typescript", "typescriptreact", "javascriptreact" },
  root_markers = { ".eslintrc.json", "package.json", "tsconfig.json", ".git" },
  settings = {
    codeAction = {
      disableRuleComment = {
        enable = true,
        location = "separateLine"
      },
      showDocumentation = {
        enable = true
      }
    },
    codeActionOnSave = {
      enable = false,
      mode = "all"
    },
    experimental = {
      useFlatConfig = false
    },
    format = true,
    nodePath = "",
    onIgnoredFiles = "off",
    problems = {
      shortenToSingleLine = false
    },
    quiet = false,
    rulesCustomizations = {},
    run = "onType",
    useESLintClass = false,
    validate = "on",
    workingDirectory = { mode = "location" },
    workspaceFolder = get_workspace_folder(),
  }
}

vim.lsp.enable("eslint")
