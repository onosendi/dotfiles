local utils = require('utils')

local function format_with_prettier(file)
  if utils.exe_exists("prettierd") then
    vim.fn.system({ "prettierd", file })
    return true
  end

  if utils.exe_exists("prettier") then
    vim.fn.system({ "prettier", "--write", file })
    return true
  end

  if utils.exe_exists("npx") then
    -- will work when a local prettier exists
    vim.fn.system({ "npx", "prettier", "--write", file })
    return true
  end

  return false
end

_G.FormatDocument = function()
  local ft = vim.bo.filetype
  local file = vim.api.nvim_buf_get_name(0)

  if ft == "javascript" or ft == "javascriptreact" or ft == "typescript" or ft == "typescriptreact" then
    for _, c in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
      if c.name == "eslint" then
        vim.lsp.buf.code_action({
          apply = true,
          context = { diagnostics = {}, only = { "source.fixAll.eslint" } },
        })
        return
      end
    end
  end

  if ft == "json" or ft == "jsonc" or ft == "yaml" or ft == "yml" then
    vim.cmd("silent write")
    local ok = format_with_prettier(file)
    if ok then
      vim.cmd("edit!")
    else
      vim.notify("No prettier/prettierd/npx found to format this file", vim.log.levels.WARN)
    end
    return
  end

  if ft == "python" then
    vim.lsp.buf.format({ name = "ruff", async = true })
    return
  end

  vim.lsp.buf.format({ async = true })
end

local function set_global_keymaps(client, bufnr)
  -- Restart LSP
  utils.set_keymap({
    key = '<leader>lr',
    cmd = function()
      local bufnr = vim.api.nvim_get_current_buf()
      local clients = vim.lsp.get_clients({ bufnr = bufnr })

      if #clients == 0 then
        vim.api.nvim_exec_autocmds("FileType", { group = "MyLsp", buffer = bufnr })
        return
      end

      for _, c in ipairs(clients) do
        local attached_buffers = vim.tbl_keys(c.attached_buffers) ---@type integer[]
        local config = c.config
        vim.lsp.stop_client(c.id, true)
        vim.defer_fn(function()
          local id = vim.lsp.start(config)
          if id then
            for _, b in ipairs(attached_buffers) do
              vim.lsp.buf_attach_client(b, id)
            end
            vim.notify(string.format("Lsp `%s` has been restarted.", config.name))
          else
            vim.notify(string.format("Error restarting `%s`.", config.name), vim.log.levels.ERROR)
          end
        end, 600)
      end
    end,
    desc = "Restart LSP server",
    bufnr = bufnr,
  })

  -- Go to definition
  utils.set_keymap({
    key = 'gd',
    cmd = ":Telescope lsp_definitions<CR>",
    desc = "Go to definition",
    bufnr = bufnr,
  })

  -- Go to type definition
  utils.set_keymap({
    key = 'gt',
    cmd = ":Telescope lsp_type_definitions<CR>",
    desc = "Go to type definition",
    bufnr = bufnr,
  })

  if client:supports_method('textDocument/declaration') then
    -- Go to declaration
    utils.set_keymap({
      key = 'gD',
      cmd = vim.lsp.buf.declaration,
      desc = "Go to declaration",
      bufnr = bufnr,
    })
  end

  -- Float diagnostics
  utils.set_keymap({
    key = '<leader>D',
    cmd = ":Telescope diagnostics bufnr=0<CR>",
    desc = "Show diagnostics for current buffer",
    bufnr = bufnr,
  })

  -- Show hover information
  utils.set_keymap({
    key = 'K',
    cmd = vim.lsp.buf.hover,
    desc = "Show hover information",
    bufnr = bufnr,
  })

  -- Go to implementation
  utils.set_keymap({
    key = 'gi',
    cmd = ":Telescope lsp_implementations<CR>",
    desc = "Go to implementation",
    bufnr = bufnr,
  })

  -- Show signature help
  utils.set_keymap({
    key = '<C-k>',
    cmd = vim.lsp.buf.signature_help,
    desc = "Show signature help",
    bufnr = bufnr,
  })

  -- Rename symbol
  utils.set_keymap({
    key = '<leader>rn',
    cmd = vim.lsp.buf.rename,
    desc = "Rename symbol",
    bufnr = bufnr,
  })

  -- Code actions
  utils.set_keymap({
    key = '<leader>ca',
    cmd = vim.lsp.buf.code_action,
    desc = "Show code actions",
    bufnr = bufnr,
  })

  -- Go to references
  utils.set_keymap({
    key = 'gr',
    cmd = ":Telescope lsp_references<CR>",
    desc = "Go to references",
    bufnr = bufnr,
  })

  -- Show line diagnostics in a floating window
  utils.set_keymap({
    key = '<leader>ld',
    cmd = vim.diagnostic.open_float,
    desc = "Show line diagnostics",
    bufnr = bufnr,
  })

  -- Go to previous diagnostic
  utils.set_keymap({
    key = '[d',
    cmd = function()
      vim.diagnostic.jump({ count = -1 })
    end,
    desc = "Go to previous diagnostic",
    bufnr = bufnr,
  })

  -- Go to next diagnostic
  utils.set_keymap({
    key = ']d',
    cmd = function()
      vim.diagnostic.jump({ count = 1 })
    end,
    desc = "Go to next diagnostic",
    bufnr = bufnr,
  })
end

local function configure_diagnostics()
  vim.diagnostic.config({
    virtual_text = { current_line = true },
    underline = true,
    update_in_insert = true,
    severity_sort = true,
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = "",
        [vim.diagnostic.severity.WARN] = "",
        [vim.diagnostic.severity.INFO] = "",
        [vim.diagnostic.severity.HINT] = "",
      },
    },
    float = {
      border = "rounded",
      source = "if_many",
    },
  })
end

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('global.lsp', { clear = true }),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    local bufnr = args.buf

    set_global_keymaps(client, bufnr)
    configure_diagnostics()
  end
})

vim.lsp.config('*', {
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
})
