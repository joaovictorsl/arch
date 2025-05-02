local telescope = require('telescope')
local builtin = require('telescope.builtin')

telescope.setup({
    pickers = {
        live_grep = {
            file_ignore_patterns = { 'node_modules', '.git', '.venv' },
            additional_args = function(_)
                return { "--hidden" }
            end
        },
        find_files = {
            file_ignore_patterns = { 'node_modules', '.git', '.venv' },
            hidden = true
        }

    },
    extensions = {
        "fzf"
    },
})

vim.keymap.set('n', '<leader>sf', builtin.find_files)
vim.keymap.set('n', '<leader>sg', builtin.live_grep)
