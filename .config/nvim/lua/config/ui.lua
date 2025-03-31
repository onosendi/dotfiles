vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.cmd [[highlight CursorLine guibg=#383a4a ctermbg=290]]
  end
})
