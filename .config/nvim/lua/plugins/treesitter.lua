return {
	"nvim-treesitter/nvim-treesitter",
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
      "diff",
			"dockerfile",
			"javascript",
			"json",
			"lua",
			"markdown",
			"markdown_inline",
			"python",
      "regex",
			"toml",
			"typescript",
			"yaml",
		},
		auto_install = true,
	},
}
