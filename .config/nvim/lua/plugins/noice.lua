return {
	"folke/noice.nvim",
	event = "VeryLazy",
	cond = not vim.g.vscode,
  opts = {
    cmdline = {
      enabled = true,
    },
  },
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
	},
}
