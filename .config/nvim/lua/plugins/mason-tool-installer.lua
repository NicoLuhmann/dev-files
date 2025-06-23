return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = {
		"mason-org/mason.nvim",
	},
	opts = {
		ensure_installed = {
			"prettierd", -- daemon prettier formatter
			"prettier", -- prettier formatter
			"stylua", -- lua formatter
			"isort", -- python formatter
			"black", -- python formatter
			"clang-format", -- c, cpp formatter
			-- "pylint", -- python linter
			-- "eslint_d", -- js linter
		},
	},
}
