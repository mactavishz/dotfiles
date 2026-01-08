return {
  'rachartier/tiny-code-action.nvim',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    {
      "folke/snacks.nvim",
      opts = {
        terminal = {},
      }
    }
  },
  event = 'LspAttach',
  opts = {},
  config = function()
    vim.keymap.set({ 'n', 'x' }, '<leader>ca', function()
      require('tiny-code-action').code_action()
    end, { noremap = true, silent = true })
    require('tiny-code-action').setup {
      picker = {
        'buffer',
        opts = {
          hotkeys = true, -- Enable hotkeys for quick selection of actions
          -- Use numeric labels.
          hotkeys_mode = function(titles)
            return vim
              .iter(ipairs(titles))
              :map(function(i)
                return tostring(i)
              end)
              :totable()
          end,
          auto_preview = true, -- Enable or disable automatic preview
          auto_accept = false, -- Automatically accept the selected action
          position = 'cursor', -- Position of the picker window
          winborder = 'single', -- Border style for picker and preview windows
          custom_keys = {
            { key = 'f', pattern = 'Fill match arms' },
            { key = 'f', pattern = 'Fill struct fields' },
          },
          notify = { enabled = false },
        },
      },
    }
  end,
}
