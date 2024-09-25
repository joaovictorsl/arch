local telescope_builtin = require('telescope.builtin')

vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
vim.api.nvim_set_hl(0, "NormalNC", {})

vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.keymap.set('n', '<leader>od', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>ld', telescope_builtin.diagnostics)
vim.keymap.set('n', '<C-S-N>', function() vim.cmd('bn') end)
vim.keymap.set('n', '<C-S-P>', function() vim.cmd('bp') end)
vim.keymap.set('n', '<leader>bd', function() vim.cmd('bd') end)
vim.keymap.set('n', '<leader>w', function() vim.cmd('w') end)
vim.keymap.set('n', '<leader>q', function() vim.cmd('q') end)
vim.keymap.set('n', '<leader>x', function() vim.cmd('x') end)

vim.api.nvim_set_option_value('shiftwidth', 4, {})
vim.api.nvim_set_option_value('softtabstop', 4, {})
