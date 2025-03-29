local utils = require('utils');

local function set_eslint_keymaps(bufnr)
  utils.set_keymap({
    key = '<leader>fa',
    cmd = function()
      vim.lsp.buf.code_action({
        apply = true,
        context = {
          diagnostics = {},
          only = { "source.fixAll" },
        }
      })
    end,
    desc = "Fix all ESLint issues",
    bufnr = bufnr,
  })
end

local function get_workspace_folder()
  local root = vim.fn.getcwd()
  return {
    name = vim.fn.fnamemodify(root, ":t"),
    uri = vim.uri_from_fname(root),
  }
end

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('eslint.lsp', { clear = true }),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    local bufnr = args.buf

    if client.name == "eslint" then
      set_eslint_keymaps(bufnr)
    end
  end
})

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
