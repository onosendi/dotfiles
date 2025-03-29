local utils = require('utils');

local function set_typescript_keymaps(client, bufnr)
  -- Organize Imports
  utils.set_keymap({
    key = '<leader>oi',
    cmd = function()
      client:exec_cmd({
        command = "_typescript.organizeImports",
        arguments = { vim.api.nvim_buf_get_name(bufnr) }
      })
    end,
    desc = "Organize Imports",
    bufnr = bufnr,
  })

  -- Remove Unused Imports
  utils.set_keymap({
    key = '<leader>ri',
    cmd = function()
      vim.lsp.buf.code_action({
        apply = true,
        context = {
          diagnostics = {},
          ---@diagnostic disable-next-line: assign-type-mismatch
          only = { "source.removeUnusedImports.ts" },
        }
      })
    end,
    desc = "Remove Unused Imports",
    bufnr = bufnr,
  })

  -- Add Missing Imports
  utils.set_keymap({
    key = '<leader>ai',
    cmd = function()
      vim.lsp.buf.code_action({
        apply = true,
        context = {
          diagnostics = {},
          ---@diagnostic disable-next-line: assign-type-mismatch
          only = { "source.addMissingImports.ts" },
        }
      })
    end,
    desc = "Add Missing Imports",
    bufnr = bufnr,
  })
end


vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("ts_ls.lsp", { clear = true }),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    local bufnr = args.buf

    if client.name == "ts_ls" then
      set_typescript_keymaps(client, bufnr)
    end
  end
})

vim.lsp.config.ts_ls = {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "typescript", "typescriptreact", "javascriptreact" },
  root_markers = { "tsconfig.json", "package.json" },
}

vim.lsp.enable("ts_ls")
