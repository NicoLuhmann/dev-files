return {
	"CopilotC-Nvim/CopilotChat.nvim",
	enable = NVIM_MODE == "max",
	cond = not vim.g.vscode,
	dependencies = {
		{ "zbirenbaum/copilot.lua" }, -- or zbirenbaum/copilot.lua
		{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
	},
	build = "make tiktoken", -- Only on MacOS or Linux
	opts = {
		window = {
			layout = "horizontal",
      height = 0.33,
		},
		-- See Configuration section for options
	},
  keys = {
    {
      "<leader>zz",
      ":CopilotChatOpen<CR>",
      mode = "n",
      desc = "Toggle Chat window"
    },
    {
      "<leader>zt",
      ":CopilotChatToggle<CR>",
      mode = "n",
      desc = "Toggle Chat window"
    },
    {
      "<leader>zu",
      ":CopilotChatSave<CR>:CopilotChatReset<CR>",
      mode = "n",
      desc = "Save and reset chat"
    },
    {
      "<leader>zyy",
      ":CopilotChatSave ",
      mode = "n",
      desc = "Yank chat to name:"
    },
    {
      "<leader>zy1",
      ":CopilotChatSave 1<CR>",
      mode = "n",
      desc = "Yank chat to 1"
    },
    {
      "<leader>zy2",
      ":CopilotChatSave 2<CR>",
      mode = "n",
      desc = "Yank chat to 2"
    },
    {
      "<leader>zy3",
      ":CopilotChatSave 3<CR>",
      mode = "n",
      desc = "Yank chat to 3"
    },
    {
      "<leader>zpp",
      ":CopilotChatOpen<CR>:CopilotChatLoad",
      mode = "n",
      desc = "Paste chat from name: "
    },
    {
      "<leader>zl",
      ":CopilotChatLoad default<CR>:CopilotChatOpen<CR>",
      mode = "n",
      desc = "Paste last default chat"
    },
    {
      "<leader>zp1",
      ":CopilotChatLoad 1<CR>:CopilotChatOpen<CR>",
      mode = "n",
      desc = "Paste chat from 1"
    },
    {
      "<leader>zp2",
      ":CopilotChatLoad 2<CR>:CopilotChatOpen<CR>",
      mode = "n",
      desc = "Paste chat from 2"
    },
    {
      "<leader>zp3",
      ":CopilotChatLoad 3<CR>:CopilotChatOpen<CR>",
      mode = "n",
      desc = "Paste chat from 3"
    },
    {
      "<leader>zo",
      ":CopilotChatOptimize<CR>",
      mode = "v",
      desc = "Optimize Code"
    },
    {
      "<leader>zf",
      ":CopilotChatFix<CR>",
      mode = "v",
      desc = "Fix Code Issues"
    },
    {
      "<leader>zr",
      ":CopilotChatReview<CR>",
      mode = "v",
      desc = "Review Code"
    },
    {
      "<leader>ze",
      ":CopilotChatExplain<CR>",
      mode = "v",
      desc = "Explain Code"
    },
    {
      "<leader>zd",
      ":CopilotChatDocs<CR>",
      mode = "v",
      desc = "Generate Docs"
    },
    {
      "<leader>zt",
      ":CopilotChatTests<CR>",
      mode = "v",
      desc = "Generate Tests"
    },
    {
      "<leader>zc",
      ":CopilotChatCommit<CR>",
      mode = "n",
      desc = "Generate Commit Message"
    },
  },
	-- See Commands section for default commands if you want to lazy load on them,
}
