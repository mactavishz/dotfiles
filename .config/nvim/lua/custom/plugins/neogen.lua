return {
  'danymat/neogen',
  cond = vim.g.vscode == nil,
  config = function()
    local neogen = require 'neogen'
    neogen.setup {
      enabled = true,
      input_after_comment = true,
    }
    vim.keymap.set('n', '<leader>cg', neogen.generate, { desc = 'Generate a new function' })
  end,
  -- Uncomment next line if you want to follow only stable versions
  -- version = "*"
}
