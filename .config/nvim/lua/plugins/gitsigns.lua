-- Adds git related signs to the gutter, as well as utilities for managing changes
-- NOTE: gitsigns is already included in init.lua but contains only the base
-- config. This will add also the recommended keymaps.

return {
  {
    'lewis6991/gitsigns.nvim',
    lazy = false,
    cond = vim.g.vscode == nil,
    opts = {
      current_line_blame = true,
    },
  },
}
