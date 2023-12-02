vim.g.mapleader = " "
vim.api.nvim_set_keymap('n', '<leader>pv', [[:w<CR>:Ex<CR>]], { noremap = true, silent = true })
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
--
--
