return {
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  cond = vim.g.vscode == nil,
  -- Optional dependencies
  dependencies = {
    { "echasnovski/mini.icons", opts = {} },
    "refractalize/oil-git-status.nvim",
  },
  config = function()
    local oil = require("oil")
    oil.setup({
      default_file_explorer = true,
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,
        natural_sort = true,
        is_always_hidden = function(name, _path)
          return name == "node_modules" or name == ".git"
        end,
      },
      win_options = {
        signcolumn = "yes:2",
        wrap = true,
      },
      keymaps = {
        ["<C-v>"] = { "actions.select", opts = { vertical = true } },
        ["<C-x>"] = { "actions.select", opts = { horizontal = true } },
        ["<C-d>"] = { "actions.close", mode = "n" },
      },
    })

    require("oil-git-status").setup({
      show_ignored = false,
    })
    vim.keymap.set("n", "-", oil.toggle_float, { desc = "Open oil in parent directory" })
  end,
}
