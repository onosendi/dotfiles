return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "bashls",
          "eslint",
          "jsonls",
          "lua_ls",
          "pyright",
          "ts_ls",
        },
        automatic_installation = true,
      })
    end
  }
}
