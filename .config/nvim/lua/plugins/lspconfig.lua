return {
  "neovim/nvim-lspconfig",
  cond = not vim.g.vscode,
  dependencies = {
    "j-hui/fidget.nvim",
    {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          { path = "{3rd}/luv-library", words = { "vim%.uv" } },
        },
      },
    },
  },
  keys = {
    { "<leader>li", "<cmd>LspInfo<cr>", desc = "LSP Info" },
    { "<leader>lI", "<cmd>LspInstallInfo<cr>", desc = "LSP Install Info" },
    { "<leader>lr", "<cmd>LspRestart<cr>", desc = "LSP Restart" },
    { "<leader>ld", "<cmd>LspDiagnostics<cr>", desc = "LSP Diagnostics" },
  },
  config = function()
    local capabilities = require("blink.cmp").get_lsp_capabilities()
    require("lspconfig").lua_ls.setup { capabilities = capabilities }
  end, 
}
