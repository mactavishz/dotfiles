return {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        disable = { 'missing-fields' },
        globals = {
          'vim',
          'Snacks',
        },
      },
      hint = {
        enable = true,
        setType = false,
        paramType = true,
        paramName = 'Disable',
        semicolon = 'Disable',
        arrayIndex = 'Disable',
      },
      workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
    },
  },
}
