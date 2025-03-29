local utils = require('utils');

local function set_eslint_keymaps(client, bufnr)
  utils.set_keymap({
    key = '<leader>fa',
    cmd = function()
      vim.lsp.buf.code_action({
        apply = true,
        context = { only = { "source.fixAll.eslint" } }
      })
    end,
    desc = "Fix all ESLint issues",
    bufnr = bufnr,
  })
end

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('eslint.lsp', { clear = true }),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    local bufnr = args.buf

    if client.name == "eslint" then
      set_eslint_keymaps(client, bufnr)
    end
  end
})

vim.lsp.config.eslint = {
  cmd = { "vscode-eslint-language-server", "--stdio" },
  filetypes = { "javascript", "typescript", "typescriptreact", "javascriptreact" },
  root_markers = { ".eslintrc.json" },
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
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
    workingDirectory = {
      mode = "location"
    },
  }
}

vim.lsp.enable("eslint")
