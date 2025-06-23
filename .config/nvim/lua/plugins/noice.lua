return {
	"folke/noice.nvim",
	event = "VeryLazy",
	cond = not vim.g.vscode,
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
	},
}
