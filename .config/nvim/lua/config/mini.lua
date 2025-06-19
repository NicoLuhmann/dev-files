local keymap = vim.keymap
require("mini.surround").setup({
    search_method = "cover_or_next",
})
require("mini.comment").setup({})
require("mini.ai").setup({})

if not vim.g.vscode then
    require("mini.indentscope").setup({})
    require("mini.icons").setup({})
    require("mini.pairs").setup({})
    require("mini.git").setup({})
    require("mini.diff").setup({})
    require("mini.statusline").setup({})
    require("mini.tabline").setup({})
    require("mini.files").setup({
        keymap.set("n", "<leader>e", ":lua MiniFiles.open()<CR>", { silent = true }),
    })
end