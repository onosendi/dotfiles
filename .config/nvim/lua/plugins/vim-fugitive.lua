return {
  "tpope/vim-fugitive",

  config = function()
    local map = vim.api.nvim_set_keymap
    local options = { noremap = true }

    map('n', '<Leader>gg', ':Git<CR>', options)
    map('n', '<Leader>gl', ':Git l<CR>', options)
    map('n', '<Leader>gdv', ':Gvdiffsplit<CR>', options)
  end
}
