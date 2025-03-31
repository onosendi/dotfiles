-- Set the leader key to space
vim.g.mapleader = ' '
vim.g.maplocalleader = "\\"

-- Clear search highlighting
vim.keymap.set('n', '<leader>ch', ':let @/=""<CR>')

-- Highlight all words under cursor
-- vim.keymap.set('n', '<leader>hw', ':let @/=expand("<cword>")<CR>')
vim.keymap.set('n', '<leader>hw', ':let @/=expand("<cword>")<CR>:set hlsearch<CR>')

-- Navigate between windows using Ctrl + arrow keys
vim.keymap.set('n', '<C-J>', '<C-W><C-J>')
vim.keymap.set('n', '<C-K>', '<C-W><C-K>')
vim.keymap.set('n', '<C-L>', '<C-W><C-L>')
vim.keymap.set('n', '<C-H>', '<C-W><C-H>')

-- Use this for navigation in terminal mode
vim.keymap.set('t', '<C-k>', [[<C-\><C-n><C-W>k]])

-- Enter normal mode in a terminal buffer.
vim.keymap.set('t', '<C-o>', '<C-\\><C-n>')

-- Make all windows equal size
vim.keymap.set('n', '<leader>rw', '<C-W>=')
