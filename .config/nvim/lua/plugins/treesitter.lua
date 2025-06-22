return {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    config = function()
        local treesitter = require("nvim-treesitter.configs")
        treesitter.setup({
            highlight = {
                enable = not vim.g.vscode, -- Disable highlighting in VSCode
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = not vim.g.vscode, -- Disable indenting in VSCode
            },
            ensure_installed = {
                "bash",
                "c",
                "cmake",
                "cpp",
                "css",
                "dockerfile",
                "html",
                "java",
                "javascript",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "rust",
                "toml",
                "typescript",
                "yaml",
            },
            auto_install = false,
        })
    end,
}