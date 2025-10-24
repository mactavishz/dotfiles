return {
  'rmagatti/auto-session',
  cond = vim.g.vscode == nil,
  lazy = false,
  keys = {
    { '<leader>fs', '<cmd>AutoSession search<CR>', desc = 'Session search' },
  },
  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    suppressed_dirs = { '~/', '~/Downloads', '/' },
    -- log_level = 'debug',
  },
}
