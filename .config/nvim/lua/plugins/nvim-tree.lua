return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimtree = require("nvim-tree")

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
      view = {
        width = 35,
        relativenumber = true,
      },
      renderer = {
        indent_markers = {
          enable = true,
        },
      },
      filters = {
        custom = {},
      },
      git = {
        ignore = false,
      },
    })
  end,
  keys = {
    {
      "<leader>ee",
      ":NvimTreeToggle<CR>",
      mode = { "n" },
      desc = "Toggle file explorer",
    },
    {
      "<leader>ef",
      ":NvimTreeFindFileToggle<CR>",
      mode = { "n" },
      desc = "Toggle file explorer on current file",
    },
    {
      "<leader>ec",
      ":NvimTreeCollapse<CR>",
      mode = { "n" },
      desc = "Collapse file explorer",
    },
    {
      "<leader>er",
      ":NvimTreeRefresh<CR>",
      mode = { "n" },
      desc = "Refresh file explorer"
    },
  },
}
