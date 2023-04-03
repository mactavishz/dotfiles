local status_ok, bufferline = pcall(require, "barbar")
if not status_ok then
    return
end

bufferline.setup({
    icons = {
       pinned = {
           button = '車',
       },
    },
    animation = true
})

local opts = { noremap = true, silent = true }

-- Move to previous/next
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferPrevious<CR>', opts)
vim.keymap.set('n', '<Tab>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
vim.keymap.set('n', '<S-Left>', '<Cmd>BufferMovePrevious<CR>', opts)
vim.keymap.set('n', '<S-Right>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
vim.keymap.set('n', '<leader>1', '<Cmd>BufferGoto 1<CR>', opts)
vim.keymap.set('n', '<leader>2', '<Cmd>BufferGoto 2<CR>', opts)
vim.keymap.set('n', '<leader>3', '<Cmd>BufferGoto 3<CR>', opts)
vim.keymap.set('n', '<leader>4', '<Cmd>BufferGoto 4<CR>', opts)
vim.keymap.set('n', '<leader>5', '<Cmd>BufferGoto 5<CR>', opts)
vim.keymap.set('n', '<leader>6', '<Cmd>BufferGoto 6<CR>', opts)
vim.keymap.set('n', '<leader>7', '<Cmd>BufferGoto 7<CR>', opts)
vim.keymap.set('n', '<leader>8', '<Cmd>BufferGoto 8<CR>', opts)
vim.keymap.set('n', '<leader>9', '<Cmd>BufferGoto 9<CR>', opts)
vim.keymap.set('n', '<leader>0', '<Cmd>BufferLast<CR>', opts)
-- Magic buffer-picking mode
vim.keymap.set('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
-- Pin/unpin buffer
vim.keymap.set('n', '<leader>bb', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
vim.keymap.set('n', '<leader>bc', '<Cmd>BufferClose<CR>', opts)
