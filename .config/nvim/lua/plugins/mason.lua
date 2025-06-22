return {
	"mason-org/mason.nvim",
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	cond = not vim.g.vscode,
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"clangd", -- c and c++ language server
				"ts_ls", -- typescript and javascript language server
				"cssls", -- css language server
        "dockerls", -- dockerfile language server
        "docker_compose_language_service", -- docker compose language server
				"lua_ls", -- lua language server
				"pyright", -- python language server
				"html", -- html language server
				"jsonls", -- json language server
				"yamlls", -- yaml language server
				"bashls", -- bash language server
				"cmake", -- cmake language server
				"lemminx", -- xml
				"taplo", -- toml
			},
			--     -- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same as ensure_installed
		})

		mason_tool_installer.setup({
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
		})
	end,
}
