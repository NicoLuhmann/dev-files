return {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
        local keymap = vim.keymap
        require("mini.surround").setup({
            custom_surroundings = {
                ['(']= { output = { left = '( ', right = ' )' } },
                ['['] = { output = { left = '[ ', right = ' ]' } },
                ['{'] = { output = { left = '{ ', right = ' }' } },
                ['<'] = { output = { left = '< ', right = ' >' } },
            },
            search_method = "cover_or_next",
            mappings = {
                add = "ys",
                delete = "ds",
                find = "",
                find_left = "",
                highlight = "",
                replace = "cs",
                update_n_lines = "",
            },
        })
        require("mini.comment").setup({})
        require("mini.ai").setup({})
        require("mini.move").setup({})
        require("mini.jump").setup({
            delay = {
              highlight = 10000000,
            }
        })
        require("mini.splitjoin").setup({})

        if not vim.g.vscode then
            require("mini.icons").setup({})
            require("mini.pairs").setup({})
            require("mini.git").setup({})
            require("mini.diff").setup({})
            require("mini.statusline").setup({})
            require("mini.tabline").setup({})
            require("mini.notify").setup({})
            require("mini.cursorword").setup({})
            require("mini.completion").setup({})
            require("mini.files").setup({
                keymap.set("n", "<leader>e", ":lua MiniFiles.open()<CR>", { silent = true }),
            })
        end
    end,
}
