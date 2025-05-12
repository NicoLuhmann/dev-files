local keymap = vim.keymap
-- move lines vertically
keymap.set("n","<M-j>",":m +1<CR>")
keymap.set("n","<M-k>",":m -2<CR>")
keymap.set("i","<M-j>","<Esc>:m +1<CR>gi")
keymap.set("i","<M-k>","<Esc>:m -2<CR>gi")
keymap.set("v","<M-j>",":m '>+1<CR>gv=gv")
keymap.set("v","<M-k>",":m '<-2<CR>gv=gv")