-- [[ Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
local is_vscode = vim.g.vscode ~= nil

vim.keymap.set('n', '<CR>', function()
  ---@diagnostic disable-next-line: undefined-field
  if vim.v.hlsearch == 1 then
    vim.cmd.nohl()
    return ''
  else
    return vim.keycode '<CR>'
  end
end, { expr = true })

vim.keymap.set('n', '<leader>dt', function()
  if vim.diagnostic.is_enabled() then
    vim.diagnostic.enable(false)
  else
    vim.diagnostic.enable()
  end
end)

-- Exit insert mode without hitting Esc
vim.keymap.set('i', 'jk', '<Esc><Esc>', { desc = 'Esc' })
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- see: https://stackoverflow.com/questions/20975928/moving-the-cursor-through-long-soft-wrapped-lines-in-vim
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

vim.keymap.set({ 'n', 'o', 'x' }, '<s-h>', '^', { desc = 'Jump to beginning of line' })
vim.keymap.set({ 'n', 'o', 'x' }, '<s-l>', 'g_', { desc = 'Jump to end of line' })

if not is_vscode then
  -- Save and quit
  -- vim.keymap.set('n', 'QQ', ':q!<enter>', { noremap = false })
  -- vim.keymap.set('n', 'WW', ':w!<enter>', { noremap = false })
  -- Move block
  vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move Block Down' })
  vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move Block Up' })
  vim.keymap.set('n', '<leader>x', '<cmd>.lua<CR>', { desc = 'Execute the current line' })
  vim.keymap.set('n', '<leader><leader>x', '<cmd>source %<CR>', { desc = 'Execute the current file' })

  -- Diagnostic keymaps
  vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

  -- buffers
  vim.api.nvim_set_keymap('n', ';k', ':blast<enter>', { noremap = false })
  vim.api.nvim_set_keymap('n', ';j', ':bfirst<enter>', { noremap = false })
  vim.api.nvim_set_keymap('n', ';h', ':bprev<enter>', { noremap = false })
  vim.api.nvim_set_keymap('n', ';l', ':bnext<enter>', { noremap = false })
  vim.api.nvim_set_keymap('n', ';d', ':bdelete<enter>', { noremap = false })

  -- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
  -- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
  -- is not what someone will guess without a bit more experience.
  --
  -- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
  -- or just use <C-\><C-n> to exit terminal mode
  vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
end

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to navigate between items in quickfix list
vim.keymap.set('n', '<M-j>', '<cmd>cnext<CR>', { desc = 'Go to the next item in the quickfix list' })
vim.keymap.set('n', '<M-k>', '<cmd>cnext<CR>', { desc = 'Go to the previous item in the quickfix list' })
