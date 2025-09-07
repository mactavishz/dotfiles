return {
  'ibhagwan/fzf-lua',
  -- optional for icon support
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "echasnovski/mini.icons" },
  cond = vim.g.vscode == nil,
  opts = {},
  config = function(_, opts)
    local fzf_lua = require 'fzf-lua'
    local map = vim.keymap.set
    -- Smartly opens either git_files or find_files, depending on whether the working directory is
    -- contained in a Git repo.
    function find_project_files()
      fzf_lua.files { resume = true }
      -- end
    end
    fzf_lua.setup {
      actions = {
        files = {
          ['default'] = fzf_lua.actions.file_edit_or_qf,
          ['ctrl-x'] = fzf_lua.actions.file_split,
          ['ctrl-v'] = fzf_lua.actions.file_vsplit,
          ['ctrl-t'] = fzf_lua.actions.file_tabedit,
          ['alt-q'] = fzf_lua.actions.file_sel_to_qf,
        },
      },
      buffers = {
        actions = {
          ['ctrl-d'] = { fzf_lua.actions.buf_del, fzf_lua.actions.resume },
          ['ctrl-x'] = fzf_lua.actions.buf_split,
        },
      },
    }
    map('n', '<leader>fh', fzf_lua.helptags, { desc = '[F]ind [H]elp' })
    map('n', '<leader>fk', fzf_lua.keymaps, { desc = '[F]ind [K]eymaps' })
    map('n', '<leader>ff', fzf_lua.files, { desc = '[F]ind [F]iles' })
    map('n', '<leader>fw', fzf_lua.grep_cword, { desc = '[F]ind current [W]ord' })
    map('n', '<leader>fg', fzf_lua.git_files, { desc = '[F]ind by [g]it' })
    map('n', '<leader>gg', fzf_lua.live_grep, { desc = '[F]ind by [G]rep' })
    map('n', '<leader>fd', fzf_lua.diagnostics_document, { desc = '[F]ind [D]iagnostics' })
    map('n', '<leader>f.', fzf_lua.oldfiles, { desc = '[F]ind Recent Files ("." for repeat)' })
    map('n', '<space><space>', fzf_lua.buffers, { desc = '[F]ind existing buffers' })
    -- -- Slightly advanced example of overriding default behavior and theme
    map('n', '<leader>/', fzf_lua.blines, { desc = '[/] Fuzzily search in current buffer' })
  end,
}
