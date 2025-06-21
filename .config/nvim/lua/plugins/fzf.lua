return{
  "ibhagwan/fzf-lua",
  cond = not vim.g.vscode,
  opts = {},
  keys = {
    { "<leader>p", "<cmd>FzfLua files<cr>", desc = "FzfLua: Files" },
    { "<leader>g", "<cmd>FzfLua live_grep<cr>", desc = "FzfLua: Live Grep" },
    { "<leader>b", "<cmd>FzfLua buffers<cr>", desc = "FzfLua: Buffers" },
  }
}