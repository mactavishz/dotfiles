return { -- Collection of various small independent plugins/modules
  "echasnovski/mini.nvim",
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
    --  - ci'  - [C]hange [I]nside [']quote
    require("mini.ai").setup({ n_lines = 500 })

    -- Highlight the word under the cursor, for better 'iw' text object selection
    require("mini.cursorword").setup()

    -- Pair completion, like `(`, `{`, `[` and quotes etc.
    -- require('mini.pairs').setup()
    -- ... and there is more!
    --  Check out: https://github.com/echasnovski/mini.nvim
  end,
}
