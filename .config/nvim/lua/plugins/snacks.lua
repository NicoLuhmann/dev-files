return {
    "folke/snacks.nvim",
    priority = 1000,
    cond = not vim.g.vscode,
    lazy = false,
    opts = {
        indent = { enabled = true },
        lazygit = { enabled = true },
    },
    keys = {
        {
            "<leader>lg",
            function() require("snacks").lazygit.open() end,
            desc = "Open LazyGit (Snacks)",
        },
    },
}