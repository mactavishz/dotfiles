-- Utility functions for LSP configuration
local M = {}

-- Mapping from lsp config file names to mason LSP names
-- This handles cases where the file name doesn't match the mason package name
local lsp_name_mapping = {
  -- Add mappings here if needed
  -- ['file-name'] = 'mason-package-name',
}

-- Get the mason LSP name from a config file name
function M.get_mason_lsp_name(filename)
  local name = filename:match('(.+)%.lua$') or filename
  return lsp_name_mapping[name] or name
end

-- Get the vim.lsp.enable name from a config file name
function M.get_lsp_enable_name(filename)
  local name = filename:match('(.+)%.lua$') or filename
  return name
end

-- Scan the lsp directory and return a list of LSP names
function M.scan_lsp_configs()
  local lsp_dir = vim.fn.stdpath('config') .. '/lsp'
  local lsp_files = {}
  
  -- Check if directory exists
  if vim.fn.isdirectory(lsp_dir) == 0 then
    return lsp_files
  end
  
  -- Scan for .lua files
  local files = vim.fn.readdir(lsp_dir)
  for _, file in ipairs(files) do
    if file:match('%.lua$') then
      table.insert(lsp_files, file)
    end
  end
  
  return lsp_files
end

-- Get list of mason LSP names from lsp config files
function M.get_mason_lsp_list()
  local config_files = M.scan_lsp_configs()
  local mason_lsps = {}
  
  for _, file in ipairs(config_files) do
    local mason_name = M.get_mason_lsp_name(file)
    table.insert(mason_lsps, mason_name)
  end
  
  -- Remove duplicates and sort
  local seen = {}
  local unique_lsps = {}
  for _, lsp in ipairs(mason_lsps) do
    if not seen[lsp] then
      seen[lsp] = true
      table.insert(unique_lsps, lsp)
    end
  end
  
  table.sort(unique_lsps)
  return unique_lsps
end

-- Get list of LSP names for vim.lsp.enable
function M.get_lsp_enable_list()
  local config_files = M.scan_lsp_configs()
  local enable_lsps = {}
  
  for _, file in ipairs(config_files) do
    local enable_name = M.get_lsp_enable_name(file)
    table.insert(enable_lsps, enable_name)
  end
  
  -- Remove duplicates and sort
  local seen = {}
  local unique_lsps = {}
  for _, lsp in ipairs(enable_lsps) do
    if not seen[lsp] then
      seen[lsp] = true
      table.insert(unique_lsps, lsp)
    end
  end
  
  table.sort(unique_lsps)
  return unique_lsps
end

return M

