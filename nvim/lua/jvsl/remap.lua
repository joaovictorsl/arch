vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
vim.api.nvim_set_hl(0, "NormalNC", {})

vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.keymap.set('n', '<leader>od', vim.diagnostic.open_float)

vim.api.nvim_set_option_value('shiftwidth', 4, {})
vim.api.nvim_set_option_value('softtabstop', 4, {})
