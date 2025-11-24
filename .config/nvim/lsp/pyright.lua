return {
  settings = {
    -- pyright = {
    --   disableOrganizeImports = true, -- Using Ruff
    -- },
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = 'openFilesOnly',
      },
    },
  },
}
