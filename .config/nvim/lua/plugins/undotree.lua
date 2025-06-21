return {
  "mbbill/undotree",
  cond = not vim.g.vscode,
  keys = {
    { "<leader>u", ":UndotreeToggle<cr>" }
  },
  init = function()
    vim.g.undotree_SetFocusWhenToggle = 1
  end,
}
