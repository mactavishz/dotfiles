return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "black")
    end,
  },
  {
<<<<<<< HEAD
    "jose-elias-alvarez/null-ls.nvim",
=======
    "nvimtools/none-ls.nvim",
>>>>>>> 492dd65 (update nvim confg)
    opts = function(_, opts)
      local nls = require("null-ls")
      table.insert(opts.sources, nls.builtins.formatting.black)
    end,
  },
}
