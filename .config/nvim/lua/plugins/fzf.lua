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
          -- actions inherit from 'actions.files' and merge
          -- by supplying a table of functions we're telling
          -- fzf-lua to not close the fzf window, this way we
          -- can resume the buffers picker on the same window
          -- eliminating an otherwise unaesthetic win "flash"
          ['ctrl-x'] = false,
          ['ctrl-d'] = { fn = fzf_lua.actions.buf_del, reload = true },
        },
      },
    }
    -- Jump to the definition of the word under your cursor.
    --  This is where a variable was first declared, or where a function is defined, etc.
    --  To jump back, press <C-t>.
    map('n', 'gd', fzf_lua.lsp_definitions, { desc = '[G]oto [D]efinition' })

    -- Find references for the word under your cursor.
    map('n', 'gr', fzf_lua.lsp_references, { desc = '[G]oto [R]eferences' })

    -- Jump to the implementation of the word under your cursor.
    --  Useful when your language has ways of declaring types without an actual implementation.
    map('n', 'gI', fzf_lua.lsp_implementations, { desc = '[G]oto [I]mplementation' })

    -- Jump to the type of the word under your cursor.
    --  Useful when you're not sure what type a variable is and you want to see
    --  the definition of its *type*, not where it was *defined*.
    map('n', '<leader>D', fzf_lua.lsp_typedefs, { desc = 'Type [D]efinition' })

    -- Fuzzy find all the symbols in your current document.
    --  Symbols are things like variables, functions, types, etc.
    map('n', '<leader>ds', fzf_lua.lsp_document_symbols, { desc = '[D]ocument [S]ymbols' })

    -- Fuzzy find all the symbols in your current workspace.
    --  Similar to document symbols, except searches over your entire project.
    map('n', '<leader>ws', fzf_lua.lsp_workspace_symbols, { desc = '[W]orkspace [S]ymbols' })
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
