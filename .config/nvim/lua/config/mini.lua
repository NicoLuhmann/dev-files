local keymap = vim.keymap
require("mini.surround").setup({
    search_method = "cover_or_next",
})
require("mini.comment").setup({})
require("mini.ai").setup({})
require("mini.move").setup({})
require("mini.jump").setup({
  delay = {
    highlight = 10000000,
  }
})
require("mini.splitjoin").setup({})

if not vim.g.vscode then
  require("mini.indentscope").setup({})
  require("mini.icons").setup({})
  require("mini.pairs").setup({})
  require("mini.git").setup({})
  require("mini.diff").setup({})
  require("mini.statusline").setup({})
  require("mini.tabline").setup({})
  require("mini.notify").setup({})
  require("mini.cursorword").setup({})
  require("mini.completion").setup({})
  -- require("mini.pick").setup({
  --   keymap.set("n", "<leader>p", ":Pick files<CR>" ),
  --   keymap.set("n", "<leader>ff", ":Pick grep_live<CR>" ),
  --   keymap.set("n", "<leader>b", ":Pick buffers<CR>" ),
  -- })
  -- require("mini.files").setup({
  --   keymap.set("n", "<leader>e", ":lua MiniFiles.open()<CR>", { silent = true }),
  -- })
end
