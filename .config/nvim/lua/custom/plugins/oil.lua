return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  cond = vim.g.vscode == nil,
  -- Optional dependencies
  dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  config = function()
    local oil = require 'oil'
    oil.setup {
      default_file_explorer = true,
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,
        natural_sort = true,
        is_always_hidden = function(name, _path)
          return name == 'node_modules' or name == '.git'
        end,
      },
      win_options = {
        wrap = true,
      },
      keymaps = {
        ['<C-v>'] = { 'actions.select', opts = { vertical = true } },
        ['<C-x>'] = { 'actions.select', opts = { horizontal = true } },
        ['<C-d>'] = { 'actions.close', mode = 'n' },
      },
    }

    vim.keymap.set('n', '-', oil.toggle_float, { desc = 'Open oil in parent directory' })
  end,
}
