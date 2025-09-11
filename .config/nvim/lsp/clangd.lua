return {
  cmd = { 'clangd', '--background-index' },
  root_markers = { 'compile_commands.json', 'compile_flags.txt', '.git' },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
}
