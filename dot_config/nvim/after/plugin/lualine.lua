local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = 'catppuccin',
		component_separators = '|',
		section_separators = '',
		disabled_filetypes = {
			"alpha",
			statusline = {},
			winbar = {},
		},
	},
	sections = {
		lualine_x = {
			{
				-- show @recording marco
				require("noice").api.status.mode.get,
				cond = require("noice").api.status.mode.has,
				color = { fg = "#ff9e64" },
			},
			'encoding',
			'fileformat',
			'filetype',
		},
		lualine_y = { 'progress' },
		lualine_a = {
			{ 'mode', separator = { left = '', right = '' }, right_padding = 2 },
		},
		lualine_b = {
			{
				'buffers',
				icons_enabled = false,
				hide_filename_extension = true,
				mode = 2,
				symbols = {
					alternate_file = '' -- Text to show to identify the alternate file
				},
			}
		},
		lualine_c = { 'branch', 'diff', 'diagnostics' },
	}
})
