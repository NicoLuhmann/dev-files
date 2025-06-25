return {
	"CopilotC-Nvim/CopilotChat.nvim",
	enable = "nluh" == vim.fn.getenv("USER"),
	cond = not vim.g.vscode,
	dependencies = {
		{ "github/copilot.lua" }, -- or zbirenbaum/copilot.lua
		{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
	},
	build = "make tiktoken", -- Only on MacOS or Linux
	opts = {
		window = {
			layout = "horizontal",
      height = 0.33,
		},
		-- See Configuration section for options
	},
	-- See Commands section for default commands if you want to lazy load on them,
}
