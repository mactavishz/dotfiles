local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

telescope.setup({
    defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "smart" },
    },
})

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently used files' })
vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer]' })
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = '[G]it [F]iles' })
