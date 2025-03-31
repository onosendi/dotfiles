return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    local toggleterm = require("toggleterm")

    toggleterm.setup({
      size = 20,
      shade_terminals = false,
      shading_factor = 0,
      open_mapping = [[<c-\>]],
      on_open = function()
        vim.cmd("setlocal number")
      end,
    })

    -- Start in insert mode whenever switching to a terminal buffer.
    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "term://*",
      command = "startinsert",
    })
  end,
}
