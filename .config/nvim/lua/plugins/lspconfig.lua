return {
  "neovim/nvim-lspconfig",
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
