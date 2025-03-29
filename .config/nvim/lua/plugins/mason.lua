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
          "jsonls",
          "lua_ls",
          "ts_ls",
          "eslint",
        },
        automatic_installation = true,
      })
    end
  }
}
