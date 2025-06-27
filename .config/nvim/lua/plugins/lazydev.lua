return {
	"folke/lazydev.nvim",
	enable = NVIM_MODE ~= "min",
	ft = "lua",
	opts = {
		library = {
			{ path = "{3rd}/luv-library", words = { "vim%.uv" } },
			{ path = "dev-files", words = { "Snacks" } },
		},
	},
}
