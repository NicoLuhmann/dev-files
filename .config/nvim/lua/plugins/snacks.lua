return {
  "folke/snacks.nvim",
  priority = 1000,
  cond = not vim.g.vscode,
  lazy = false,
  opts = {
    explorer = {
      enabled = true,
      
    },
    indent = { enabled = true },
    lazygit = { enabled = true },
    picker = {
      enabled = true,
      hidden = true,
      ignored = true,
      sources = {
        files = {
          hidden = true,
          ignored = true,
          exclude = {
            "**/.git/*",
          },
        }
      }
    },
  },
  keys = {
    {
        "<leader>lg",
        function() require("snacks").lazygit.open() end,
        desc = "Open LazyGit (Snacks)",
    },
    { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
    { "<leader><leader>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
    { "<leader>p", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<leader>g", function() Snacks.picker.grep() end, desc = "Grep" },
  }, 
}
