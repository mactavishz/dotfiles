return {
  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
      -- would overrite `ensure_installed` ith the ne value.
      vim.list_extend(opts.ensure_installed, {
        "c",
        "cpp",
        "go",
        "bash",
        "rust",
        "html",
        "tsx",
        "typescript",
        "javascript",
        "json",
        "java",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "vim",
        "vimdoc",
        "yaml",
      })
    end,
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
}
