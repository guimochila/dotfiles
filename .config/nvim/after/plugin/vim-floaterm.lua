vim.keymap.set("n", "<leader>ft", ":FloatermNew --name=myfloat --height=0.8 --width=0.7 --autoclose=2 fish <CR> ")
vim.keymap.set("n", "<leader>t", ":FloatermToggle myfloat<CR>")
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>:q<CR>")
