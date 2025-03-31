return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    focus = true,
  },
  cmd = "Trouble",
  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle<CR>",
      desc = "Open trouble workspace diagnostics",
    },
    {
      "<leader>xX",
      "<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
      desc = "Open trouble document diagnostics",
    },
    {
      "<leader>xs",
      "<cmd>Trouble quickfix toggle<CR>",
      desc = "Open trouble quickfix list",
    },
    {
      "<leader>xl",
      "<cmd>Trouble loclist toggle<CR>",
      desc = "Open trouble location list",
    },
  },
}
