vim.g.lf_map_keys = 0
vim.g.lf_replace_netrw = 1
vim.g.lf_width = 0.8
vim.g.lf_height = 0.8

-- set lf toggle
vim.keymap.set('n', '<leader>lf', '<cmd>Lf<cr>')
vim.keymap.set('t', '<leader>lf', '<C-\\><C-n><cmd>lua _LF_TOGGLE()<cr>')
