return {
  "mfussenegger/nvim-lint",
	enable = NVIM_MODE ~= "min",
  event = {
    "BufReadPre",
    "BufNewFile"
  },
  opts = {

  },
}
