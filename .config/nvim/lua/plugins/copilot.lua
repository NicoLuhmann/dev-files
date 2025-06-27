return {
	"zbirenbaum/copilot.lua",
	enable = NVIM_MODE == "max",
	cmd = "Copilot",
	event = "InsertEnter", -- Load when entering insert mode
	cond = not vim.g.vscode,
	opts = {
		panel = {
			enabled = false, -- Disable the separate panel if you don't want it
		},
		suggestion = {
			enabled = true, -- Crucial: Enable inline ghost text suggestions
			auto_trigger = false, -- Copilot suggests as you type
			keymap = {
				accept = "<M-y>",
				-- Or granular acceptance:
				accept_word = "<M-w>",
				accept_line = "<M-q>",
				next = "<M-n>", -- Alt+] for next suggestion
				prev = "<M-p>", -- Alt+[ for previous suggestion
				dismiss = "<M-e>", -- Ctrl+E to dismiss current suggestion
			},
		},
		filetypes = {
			yaml = true, -- Enable for YAML files
			markdown = true, -- Enable for Markdown files
			-- Add other filetypes as needed
		},
		-- Ensure no copilot-cmp specific options are here.
		-- If you previously used copilot-cmp, make sure it's not loaded/enabled.
	},
}
