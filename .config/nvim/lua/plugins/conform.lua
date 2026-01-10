return {
  {
    -- automatically install formatters defined in conform
    "zapling/mason-conform.nvim",
    cond = vim.g.vscode == nil,
    dependencies = {
      "mason-org/mason.nvim",
      "stevearc/conform.nvim",
    },
    opts = {},
  },
  { -- Autoformat
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    cond = vim.g.vscode == nil,
    keys = {
      {
        "<leader>cf",
        function()
          require("conform").format({ async = true, lsp_format = "fallback", timeout_ms = 2500 })
        end,
        mode = { "n", "v" },
        desc = "Format file or range (in visual mode)",
      },
    },
    opts = {
      notify_on_error = true,
      -- format_on_save = function(bufnr)
      --   -- Disable "format_on_save lsp_fallback" for languages that don't
      --   -- have a well standardized coding style. You can add additional
      --   -- languages here or re-enable it for the disabled ones.
      --   local disable_filetypes = { c = true, cpp = true, go = true, rust = true }
      --   local lsp_format_opt
      --   if disable_filetypes[vim.bo[bufnr].filetype] then
      --     lsp_format_opt = 'never'
      --   else
      --     lsp_format_opt = 'fallback'
      --   end
      --   return {
      --     timeout_ms = 500,
      --     lsp_format = lsp_format_opt,
      --   }
      -- end,
      -- format_on_save = {
      --   -- I recommend these options. See :help conform.format for details.
      --   lsp_format = 'fallback',
      --   timeout_ms = 2500,
      -- },
      formatters_by_ft = {
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        -- You can use 'stop_after_first' to run the first available formatter from the list
        -- javascript = { "prettierd", "prettier", stop_after_first = true },
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        python = { "ruff_format", lsp_format = "fallback" },
        -- You can customize some of the format options for the filetype (:help conform.format)
        rust = { "rustfmt", lsp_format = "fallback" },
        -- Conform will run the first available formatter
        javascript = { "prettierd", "prettier", stop_after_first = true },

        astro = { "prettier" },

        go = { "goimports", "gofmt" },

        yaml = { "yamlfix" },

        sh = { "shfmt" },
        ["markdown"] = { "prettierd" },
        ["markdown.mdx"] = { "prettierd" },
      },
    },
  },
}
