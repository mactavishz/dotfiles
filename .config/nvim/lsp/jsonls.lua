return {
  settings = {
    -- https://github.com/b0o/SchemaStore.nvim
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
  },
}
