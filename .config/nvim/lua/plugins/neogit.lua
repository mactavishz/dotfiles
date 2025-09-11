return {
  'NeogitOrg/neogit',
  cond = vim.g.vscode == nil,
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional - Diff integration

    -- Only one of these is needed.
    'nvim-telescope/telescope.nvim', -- optional
    -- "ibhagwan/fzf-lua",              -- optional
    -- "echasnovski/mini.pick",         -- optional
  },
  config = function()
    local neogit = require 'neogit'
    vim.keymap.set('n', '<leader>gt', function()
      neogit.open()
    end, { noremap = true, silent = true, desc = 'Open Neogit' })

    vim.keymap.set('n', '<leader>gc', function()
      neogit.open { 'commit' }
    end, { noremap = true, silent = true, desc = 'Open Neogit Commit' })

    vim.keymap.set('n', '<leader>gp', function()
      neogit.open { 'pull' }
    end, { noremap = true, silent = true, desc = 'Open Neogit Pull' })

    vim.keymap.set('n', '<leader>gP', function()
      neogit.open { 'push' }
    end, { noremap = true, silent = true, desc = 'Open Neogit Push' })
  end,
}
