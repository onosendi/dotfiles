-- Set the background theme to dark
vim.opt.background = "dark"

-- Disable backup file creation
vim.opt.backup = false

-- Set the command line height to 1 line
vim.opt.cmdheight = 1

-- Use spaces instead of tabs
vim.opt.expandtab = true

-- Support multiple file formats
vim.opt.fileformats = { "unix", "mac", "dos" }

-- Disable code folding by default
vim.opt.foldenable = false

-- Allow buffer switching without saving
vim.opt.hidden = true

-- Set command history to remember 1000 commands
vim.opt.history = 1000

-- Ignore case in search patterns
vim.opt.ignorecase = true

-- Enable lazy redraw for faster macros and scripts
vim.opt.lazyredraw = true

-- Enable regular expression magic
vim.opt.magic = true

-- Display line numbers
vim.opt.number = true

-- Display relative line numbers
vim.opt.relativenumber = true

-- Number of spaces to use for each step of (auto)indent
vim.opt.shiftwidth = 2

-- Disable highlighting matching parentheses
vim.opt.showmatch = false

-- Display the sign column with line numbers
vim.opt.signcolumn = "yes"

-- Override ignorecase if search pattern contains uppercase letters
vim.opt.smartcase = true

-- Number of spaces that a <Tab> counts for while performing editing operations
vim.opt.softtabstop = 2

-- Disable swap file creation
vim.opt.swapfile = false

-- Number of spaces that a <Tab> in the file counts for
vim.opt.tabstop = 2

-- Enable true color support
vim.opt.termguicolors = true

-- Allow specified keys to move to the previous/next line when at the beginning/end of a line
vim.opt.whichwrap = vim.opt.whichwrap:append("<,>,[,]")

-- Enable command-line completion mode
vim.opt.wildmenu = true

-- Disable line wrapping
vim.opt.wrap = false

-- Disable write backup file creation
vim.opt.writebackup = false

-- Highlight current cursor line
vim.opt.cursorline = true

-- Enable system clipboard integration
vim.opt.clipboard:append("unnamedplus")

-- Set title string
vim.opt.title = true
vim.opt.titlestring = [[%{fnamemodify(getcwd(),':t')} - %{expand('%:.')}]]

-- Ensure the completion menu appears but does not automatically select any item
vim.opt.completeopt:append("noselect")

-- Stop the terminal's cursor from blinking
vim.opt.guicursor = ""

-- Change the terminal's cursor
vim.opt.guicursor = {
  "n-v-c:block", -- Block in normal mode
  "i:ver25",     -- Vertical line in insert mode
}
