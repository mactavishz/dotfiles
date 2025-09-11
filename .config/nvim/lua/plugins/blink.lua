return {
  'saghen/blink.cmp',
  cond = vim.g.vscode == nil,
  event = 'InsertEnter',
  opts_extend = {
    'sources.completion.enabled_providers',
    'sources.compat',
    'sources.default',
  },
  -- optional: provides snippets for the snippet source
  dependencies = {
    -- 'giuxtaposition/blink-cmp-copilot',
    'fang2hou/blink-copilot',
    -- 'echasnovski/mini.nvim',
    'nvim-tree/nvim-web-devicons',
    'onsails/lspkind.nvim',
    {
      'L3MON4D3/LuaSnip',
      build = (function()
        -- Build Step is needed for regex support in snippets.
        -- This step is not supported in many windows environments.
        -- Remove the below condition to re-enable on windows.
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),
      dependencies = {
        -- `friendly-snippets` contains a variety of premade snippets.
        --    See the README about individual language/framework/plugin snippets:
        --    https://github.com/rafamadriz/friendly-snippets
        {
          'rafamadriz/friendly-snippets',
          config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
          end,
        },
      },
    },
    'rafamadriz/friendly-snippets',
  },

  -- use a release tag to download pre-built binaries
  version = 'v1.*',
  opts = {
    keymap = {
      -- preset = 'default',
      ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<C-e>'] = { 'hide' },
      ['<C-y>'] = { 'select_and_accept' },

      ['<C-p>'] = { 'select_prev', 'fallback' },
      ['<C-n>'] = { 'select_next', 'fallback' },

      ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
      -- Don't use tabs
      ['<Tab>'] = nil,
      ['<S-Tab>'] = nil,
    },

    snippets = {
      expand = function(snippet)
        require('luasnip').lsp_expand(snippet)
      end,
      active = function(filter)
        if filter and filter.direction then
          return require('luasnip').jumpable(filter.direction)
        end
        return require('luasnip').in_snippet()
      end,
      jump = function(direction)
        require('luasnip').jump(direction)
      end,
    },
    completion = {
      documentation = {
        window = { border = 'single' },
        auto_show = false,
        auto_show_delay_ms = 500,
      },
      ghost_text = { enabled = true },
      menu = {
        border = 'single',
        draw = {
          treesitter = { 'lsp' },
          columns = {
            { 'kind_icon', 'label', 'label_description', gap = 1 },
            { 'source_name', gap = 1 },
            { 'kind' },
          },
          components = {
            kind_icon = {
              text = function(ctx)
                local lspkind = require 'lspkind'
                local icon = ctx.kind_icon
                if vim.tbl_contains({ 'Path' }, ctx.source_name) then
                  local dev_icon, _ = require('nvim-web-devicons').get_icon(ctx.label)
                  if dev_icon then
                    icon = dev_icon
                  end
                elseif ctx.source_name == 'copilot' then
                  icon = ''
                else
                  icon = lspkind.symbolic(ctx.kind, {
                    mode = 'symbol',
                  })
                end

                return icon .. ctx.icon_gap
              end,
              -- Optionally, use the highlight groups from nvim-web-devicons
              -- You can also add the same function for `kind.highlight` if you want to
              -- keep the highlight groups in sync with the icons.
              highlight = function(ctx)
                local hl = ctx.kind_hl
                if vim.tbl_contains({ 'Path' }, ctx.source_name) then
                  local dev_icon, dev_hl = require('nvim-web-devicons').get_icon(ctx.label)
                  if dev_icon then
                    hl = dev_hl
                  end
                end
                return hl
              end,
            },
          },
        },
      },
    },

    appearance = {
      use_nvim_cmp_as_default = false,
      nerd_font_variant = 'mono',
    },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer', 'copilot', 'lazydev' },
      providers = {
        lazydev = {
          name = 'Lazydev',
          module = 'lazydev.integrations.blink',
          -- make lazydev completions top priority (see `:h blink.cmp`)
          score_offset = 100,
        },
        copilot = {
          name = 'copilot',
          module = 'blink-copilot',
          score_offset = 100,
          async = true,
        },
      },
    },
    fuzzy = { implementation = 'prefer_rust_with_warning' },
    -- experimental signature help support
    signature = { enabled = true, window = { border = 'single' } },
  },
  config = function(_, opts)
    require('blink-cmp').setup(opts)
    local luasnip = require 'luasnip'
    luasnip.config.setup {
      history = true,
      updateevents = 'TextChanged,TextChangedI',
    }

    -- Think of <c-l> as moving to the right of your snippet expansion.
    --  So if you have a snippet that's like:
    --  function $name($args)
    --    $body
    --  end
    --
    -- <c-l> will move you to the right of each of the expansion locations.
    -- <c-h> is similar, except moving you backwards.

    -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
    --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
    vim.keymap.set({ 'i', 's' }, '<C-l>', function()
      if luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      end
    end, { silent = true })

    vim.keymap.set({ 'i', 's' }, '<C-h>', function()
      if luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      end
    end, { silent = true })
    vim.keymap.set({ 'i', 's' }, '<C-k>', function()
      if luasnip.choice_active() then
        luasnip.change_choice(1)
      end
    end, { silent = true })
  end,
}
