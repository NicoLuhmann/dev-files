local keymap = vim.keymap
-- move lines vertically
keymap.set("n","<M-j>",":m +1<CR>")
keymap.set("n","<M-k>",":m -2<CR>")
keymap.set("i","<M-j>","<Esc>:m +1<CR>gi")
keymap.set("i","<M-k>","<Esc>:m -2<CR>gi")
keymap.set("v","<M-j>",":m '>+1<CR>gv=gv")
keymap.set("v","<M-k>",":m '<-2<CR>gv=gv")

-- Check if running in VSCode's Neovim extension
if vim.g.vscode then
    local vscode = require("vscode")
else
    vim.cmd.colorscheme "catppuccin"
    vim.opt.nu = true
    vim.opt.relativenumber = true
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2
    vim.opt.shiftwidth = 2
    vim.opt.expandtab = true
    vim.opt.smartindent = true
    vim.opt.wrap = false
    vim.opt.scrolloff = 8

    -- Set indentation settings per filetype
    -- Use 4 spaces for indentation in languages where this is the common convention
    vim.api.nvim_create_autocmd("FileType", {
        pattern = {
            "python",
            "c",
            "cpp",
            "java",
            "cmake",
            "rust",
        },
        callback = function()
            vim.opt_local.tabstop = 4
            vim.opt_local.softtabstop = 4
            vim.opt_local.shiftwidth = 4
            vim.opt_local.expandtab = true
        end,
    })

    -- Use 2 spaces for indentation in languages where this is the common convention
    vim.api.nvim_create_autocmd("FileType", {
        pattern = {
            "lua",
            "javascript",
            "typescript",
            "json",
            "yaml",
            "css",
            "html",
            "dockerfile",
            "toml",
            "markdown",
            "markdown_inline",
            "bash",
        },
        callback = function()
            vim.opt_local.tabstop = 2
            vim.opt_local.softtabstop = 2
            vim.opt_local.shiftwidth = 2
            vim.opt_local.expandtab = true
        end,
    })
end