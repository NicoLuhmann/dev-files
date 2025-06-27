_G.NVIM_MODE = require("utils.mode").get()
_G.NVIM_OS = jit.os -- e.g., "Linux", "OSX", "Windows"
-- Provider are disabled to avoid loading unnecessary providers, only needed for plugins in those languages
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
require("config.lazy")
require("config.setup")
require("config.mappings")
require("config.undo-history")
