-- local status_ok, dap = pcall(require, "dap")
-- if not status_ok then
-- 	return
-- end
--
-- local dap_ui = require("dapui")
-- local dap_python = require("dap-python")
--
-- local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
-- dap_python.setup(path)
-- dap_ui.setup()
-- dap.listeners.before.event_initialized["dapui_config"] = function()
-- 	dap_ui.open()
-- end
-- dap.listeners.after.event_terminated["dapui_config"] = function()
-- 	dap_ui.open()
-- end
-- dap.listeners.before.event_exited["dapui_config"] = function()
-- 	dap_ui.open()
-- end

-- local opts = { remap = false }
-- vim.keymap.set("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", opts)
-- vim.keymap.set("n", "<leader>dbr", function ()
-- 	dap_python.test_method()
-- end, opts)
