return {
  'NickvanDyke/opencode.nvim',
  cond = vim.g.vscode == nil,
  dependencies = {
    -- Recommended for `ask()` and `select()`.
    -- Required for `snacks` provider.
    ---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
    { 'folke/snacks.nvim', opts = { input = {}, picker = {} } },
  },
  keys = {
    {
      '<leader>oa',
      function()
        require('opencode').ask('', { submit = true })
      end,
      desc = 'Ask opencode',
      mode = 'n',
    },
    {
      '<leader>oa',
      function()
        require('opencode').ask('@this: ', { submit = true })
      end,
      desc = 'Ask opencode about selection',
      mode = 'v',
    },
    {
      '<leader>ox',
      function()
        require('opencode').select()
      end,
      desc = 'Select opencode action',
      mode = 'n',
    },
    {
      '<leader>oo',
      function()
        require('opencode').toggle()
      end,
      desc = 'Toggle opencode',
      mode = 'n',
    },
  },
  config = function()
    vim.g.opencode_opts = {
      -- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition".
      provider = {
        enabled = 'tmux',
        tmux = {
          options = '-h', -- Open in a horizontal split
        },
      },
    }
  end,
}
