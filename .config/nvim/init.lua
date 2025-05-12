-- Provider are disabled to avoid loading unnecessary providers, only needed for plugins in those languages
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
require("config.lazy")
require("config.mini")
if vim.g.vscode then
    -- VSCode extension
    require("config.vscode")
else
    -- ordinary Neovim
    vim.cmd.colorscheme "catppuccin"
    require("config.terminal")
end
