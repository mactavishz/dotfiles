return {
  cmd = { 'rust-analyzer' },
  root_markers = { 'Cargo.lock', 'Cargo.toml', '.git' },
  filetypes = { 'rust' },
  settings = {
    ['rust-analyzer'] = {
      check = {
        command = 'clippy',
      },
      diagnostics = {
        enable = true,
      },
    },
  },
}
