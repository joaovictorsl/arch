local telescope = require('telescope')
local builtin = require('telescope.builtin')

telescope.setup()

vim.keymap.set('n', '<leader>sf', function()
    builtin.find_files()
end)
vim.keymap.set('n', '<leader>sg', function()
    builtin.grep_string({ search = vim.fn.input('Grep > ') })
end)
