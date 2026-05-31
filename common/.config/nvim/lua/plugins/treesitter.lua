return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  dependencies = {
    {
      "windwp/nvim-ts-autotag",
      config = function()
        require("nvim-ts-autotag").setup()
      end,
    },
  },
  config = function()
    local languages = {
      "bash",
      "css",
      "dockerfile",
      "gitignore",
      "haskell",
      "html",
      "htmldjango",
      "javascript",
      "jsdoc",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "scss",
      "sql",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "yaml",
    }

    require("nvim-treesitter").install(languages)

    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        if pcall(vim.treesitter.start) then
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })

    local select = require("vim.treesitter._select")

    vim.keymap.set("n", "<C-space>", function()
      vim.cmd.normal({ "v", bang = true })
      select.select_parent(vim.v.count1)
    end, { desc = "Start Treesitter selection" })

    vim.keymap.set("x", "<C-space>", function()
      select.select_parent(vim.v.count1)
    end, { desc = "Expand Treesitter selection" })

    vim.keymap.set("x", "<BS>", function()
      select.select_child(vim.v.count1)
    end, { desc = "Shrink Treesitter selection" })
  end,
}
