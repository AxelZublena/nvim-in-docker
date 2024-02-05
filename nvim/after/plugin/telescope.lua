local telescope = require('telescope')

telescope.setup {
	defaults = { 
		file_ignore_patterns = {".git/", "node_modules/"},
	},
	pickers = {
		find_files = {
			hidden = true
		},
	},
}

require('telescope').load_extension('fzy_native')
require('telescope').load_extension('media_files')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.git_files, {})
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
