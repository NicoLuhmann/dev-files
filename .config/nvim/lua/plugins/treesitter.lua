return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects", -- Additional text objects for treesitter
	},
	version = false,
	build = ":TSUpdate",
	opts = {
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
			"dockerfile",
			"javascript",
			"json",
			"lua",
			"markdown",
			"markdown_inline",
			"python",
			"toml",
			"typescript",
			"yaml",
		},
		auto_install = false,
		textobjects = {
			move = {
				enable = true,
				set_jumps = true, -- whether to set jumps in the jumplist
				goto_next_start = {
					["]f"] = "@function.outer",
					["]c"] = "@class.outer",
					["]a"] = "@parameter.inner",
				},
				goto_next_end = {
					["]F"] = "@function.outer",
					["]C"] = "@class.outer",
					["]A"] = "@parameter.inner",
				},
				goto_previous_start = {
					["[f"] = "@function.outer",
					["[c"] = "@class.outer",
					["[a"] = "@parameter.inner",
				},
				goto_previous_end = {
					["[F"] = "@function.outer",
					["[C"] = "@class.outer",
					["[A"] = "@parameter.inner",
				},
			},
		},
	},
}

