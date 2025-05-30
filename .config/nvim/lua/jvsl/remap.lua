local telescope_builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>od', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>ld', telescope_builtin.diagnostics)
vim.keymap.set('n', '<C-S-N>', function() vim.cmd('bn') end)
vim.keymap.set('n', '<C-S-P>', function() vim.cmd('bp') end)
vim.keymap.set('n', '<leader>bd', function() vim.cmd('bd') end)
vim.keymap.set('n', '<leader>w', function() vim.cmd('w') end)
vim.keymap.set('n', '<leader>q', function() vim.cmd('q') end)
vim.keymap.set('n', '<leader>x', function() vim.cmd('x') end)

vim.keymap.set('n', '<leader>sf', telescope_builtin.find_files)
vim.keymap.set('n', '<leader>sg', telescope_builtin.live_grep)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)

vim.api.nvim_set_option_value('shiftwidth', 4, {})
vim.api.nvim_set_option_value('softtabstop', 4, {})
