return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    version = false,
    config = function()
        local treesitter = require("nvim-treesitter.configs")
        treesitter.setup({
            textobjects = {
                move = {
                    enable = true,
                    set_jumps = true, -- whether to set jumps in the jumplist
                    goto_next_start = { 
                        ["]f"] = "@function.outer", 
                        ["]c"] = "@class.outer", 
                        ["]a"] = "@parameter.inner" 
                    },
                    goto_next_end = { 
                        ["]F"] = "@function.outer", 
                        ["]C"] = "@class.outer", 
                        ["]A"] = "@parameter.inner" 
                    },
                    goto_previous_start = { 
                        ["[f"] = "@function.outer", 
                        ["[c"] = "@class.outer", 
                        ["[a"] = "@parameter.inner" 
                    },
                    goto_previous_end = { 
                        ["[F"] = "@function.outer", 
                        ["[C"] = "@class.outer", 
                        ["[A"] = "@parameter.inner" 
                    },
                }
            }
        })  
    end,
}