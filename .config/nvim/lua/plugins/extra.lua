local is_vscode = vim.g.vscode ~= nil
return {
  "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    "lewis6991/gitsigns.nvim",
    cond = not is_vscode,
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
    },
  },
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    "folke/lazydev.nvim",
    cond = not is_vscode,
    ft = "lua",
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim.uv" } },
        { path = "luvit-meta/library", words = { "vim%.uv" } },
        { path = "snacks.nvim/types", words = { "Snacks" } },
      },
    },
  },
  { "Bilal2453/luvit-meta", cond = not is_vscode, lazy = true },
  -- Highlight todo, notes, etc in comments
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = false },
  },
  {
    "qvalentin/helm-ls.nvim",
    ft = "helm"
  },
}
