return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
          },
        },
      },
    })
  end,
  keys = {
    {
      "<leader>ff",
      ":Telescope find_files<CR>",
      mode = { "n" },
      desc = "Lists files in your current working directory, respects .gitignore",
    },
    {
      "<leader>fg",
      ":Telescope live_grep<CR>",
      mode = { "n" },
      desc =
      "Search for a string in your current working directory and get results live as you type, respects .gitignore. (Requires ripgrep)",
    },
    {
      "<leader>fh",
      ":Telescope help_tags<CR>",
      mode = { "n" },
      desc = "",
    },
    {
      "<leader>fw",
      ":Telescope grep_string<CR>",
      mode = { "n" },
      desc = "Search for the word under your cursor in your current working directory",
    },
    {
      "<leader>fk",
      ":Telescope keymaps<CR>",
      mode = { "n" },
      desc = "",
    },
  },
}
