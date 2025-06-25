return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		require("mini.surround").setup({
			custom_surroundings = {
				["("] = { output = { left = "( ", right = " )" } },
				["["] = { output = { left = "[ ", right = " ]" } },
				["{"] = { output = { left = "{ ", right = " }" } },
				["<"] = { output = { left = "< ", right = " >" } },
			},
			search_method = "cover_or_next",
			mappings = {
				add = "<leader>sa",
				delete = "<leader>sd",
				find = "",
				find_left = "",
				highlight = "<leader>sh",
				replace = "<leader>sr",
				update_n_lines = "",
			},
		})
		require("mini.comment").setup({})
		require("mini.ai").setup({})
		require("mini.move").setup({})
		require("mini.jump").setup({
			delay = {
				highlight = 10000000,
			},
		})
		require("mini.splitjoin").setup({})

		if not vim.g.vscode then
			local miniclue = require("mini.clue")
      miniclue.setup({
        delay = 250,
				triggers = {
					-- Leader triggers
					{ mode = "n", keys = "<Leader>" },
					{ mode = "x", keys = "<Leader>" },

					-- `g` key
					{ mode = "n", keys = "g" },
					{ mode = "x", keys = "g" },

					-- Marks
					{ mode = "n", keys = "'" },
					{ mode = "n", keys = "`" },
					{ mode = "x", keys = "'" },
					{ mode = "x", keys = "`" },

					-- Registers
					{ mode = "n", keys = '"' },
					{ mode = "x", keys = '"' },
					{ mode = "i", keys = "<C-r>" },
					{ mode = "c", keys = "<C-r>" },

					-- Window commands
					{ mode = "n", keys = "<C-w>" },

					-- `z` key
					{ mode = "n", keys = "z" },
					{ mode = "x", keys = "z" },
				},

				clues = {
					-- Enhance this by adding descriptions for <Leader> mapping groups
					miniclue.gen_clues.g(),
					miniclue.gen_clues.marks(),
					miniclue.gen_clues.registers(),
					miniclue.gen_clues.windows(),
					miniclue.gen_clues.z(),
				},
			})
			require("mini.icons").setup({})
			require("mini.pairs").setup({})
			require("mini.git").setup({})
			require("mini.diff").setup({})
			require("mini.statusline").setup({})
			require("mini.tabline").setup({})
			require("mini.notify").setup({})
			require("mini.cursorword").setup({})
		end
	end,
}
