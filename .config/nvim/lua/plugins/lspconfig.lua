return {
  "neovim/nvim-lspconfig",
	enable = NVIM_MODE ~= "min",
  cond = not vim.g.vscode,
  dependencies = {
    "folke/lazydev.nvim",
    "mason-org/mason.nvim",
    "j-hui/fidget.nvim",
  },
  keys = {
    { "<leader>li", "<cmd>LspInfo<cr>", desc = "LSP Info" },
    { "<leader>lI", "<cmd>LspInstallInfo<cr>", desc = "LSP Install Info" },
    { "<leader>lr", "<cmd>LspRestart<cr>", desc = "LSP Restart" },
    { "<leader>ld", "<cmd>LspDiagnostics<cr>", desc = "LSP Diagnostics" },
  },
}
