return {
  -- Prevent lua_ls from treating $HOME as the workspace (it will refuse to load it).
  root_dir = function(bufnr, on_dir)
    local uv = vim.uv or vim.loop
    local path = vim.api.nvim_buf_get_name(bufnr)
    if path == '' then
      return on_dir(uv.cwd())
    end
    
    local root_files = {
      -- Prefer Neovim config root when editing your config
      'init.lua',
      '.luarc.json',
      '.luarc.jsonc',
      '.luacheckrc',
      '.stylua.toml',
      'stylua.toml',
      'selene.toml',
      'selene.yml',
      '.git',
    }

    local root = vim.fs.root(path, root_files)

    -- Extra safety: if root markers didn't match, still try to anchor at the Neovim config
    -- folder (the directory that contains init.lua), so we don't end up rooted at lua/plugins.
    if not root then
      local init = vim.fs.find('init.lua', { path = path, upward = true })[1]
      if init then
        root = vim.fs.dirname(init)
      end
    end

    root = root or vim.fs.dirname(path)
    if root == uv.os_homedir() then
      root = vim.fs.dirname(path)
    end
    on_dir(root)
  end,
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
        checkThirdParty = false,
			},
    },
  },
}
