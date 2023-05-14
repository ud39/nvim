local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)


local mappings = {
	i = {
	["<Tab>"] = require('telescope.actions').move_selection_previous,
	["<S-Tab>"] = require('telescope.actions').move_selection_next,
	}
}


require "telescope".setup {
	defaults = {
		mappings = mappings
	}
}
