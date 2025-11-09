return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    cond = vim.g.vscode == nil,
    config = function()
      require('copilot').setup {
        suggestion = {
          enabled = false,
          auto_trigger = false,
          keymap = {
            accept = '<M-l>',
            accept_word = false,
            accept_line = false,
            next = '<M-]>',
            prev = '<M-[>',
            dismiss = '<C-]>',
          },
        },
        panel = {
          enabled = false,
          auto_refresh = false,
          keymap = {
            jump_prev = '[[',
            jump_next = ']]',
            accept = '<CR>',
            refresh = 'gr',
            open = '<M-CR>',
          },
        },
        filetypes = {
          yaml = false,
          markdown = true,
          help = false,
          gitcommit = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ['.'] = false,
        },
      }

      -- Start Copilot in disabled state
      -- vim.defer_fn(function()
      --   vim.cmd 'Copilot disable'
      -- end, 100)
    end,
  },
  -- {
  --   'zbirenbaum/copilot-cmp',
  --   cond = vim.g.vscode == nil,
  --   config = function()
  --     require('copilot_cmp').setup()
  --   end,
  -- },
}
