return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  cond = not vim.g.vscode,
  config = function()
    require("catppuccin").setup{
      integrations = {
        mini = {
          enabled = true,
          indentscope_color ="",
        },
        snacks = {
          enabled = true,
          indentscope_color = "",
        },
      }
    }
  end,
}
