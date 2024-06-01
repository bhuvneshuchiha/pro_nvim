-- return {
-- 	"folke/trouble.nvim",
-- 	dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
-- 	keys = {
-- { "<leader>xx", "<cmd>TroubleToggle<CR>", desc = "Open/close trouble list" },
-- { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>", desc = "Open trouble workspace diagnostics" },
-- { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>", desc = "Open trouble document diagnostics" },
-- { "<leader>xq", "<cmd>TroubleToggle quickfix<CR>", desc = "Open trouble quickfix list" },
-- { "<leader>xl", "<cmd>TroubleToggle loclist<CR>", desc = "Open trouble location list" },
-- { "<leader>xt", "<cmd>TodoTrouble<CR>", desc = "Open todos in trouble" },
-- 	},
-- }
-- return {
-- 	"folke/trouble.nvim",
-- 	dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
-- 	branch = "dev", -- IMPORTANT!
-- 	cmd = { "TroubleToggle", "Trouble" },
-- 	opts = { use_diagnostic_signs = true },
-- 	lazy = true,
-- 	keys = {
--
-- 		{ "<leader>xx", "<cmd>TroubleToggle<CR>", desc = "Open/close trouble list" },
-- 		{ "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>", desc = "Open trouble workspace diagnostics" },
-- 		{ "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>", desc = "Open trouble document diagnostics" },
-- 		{ "<leader>xq", "<cmd>TroubleToggle quickfix<CR>", desc = "Open trouble quickfix list" },
-- 		{ "<leader>xl", "<cmd>TroubleToggle loclist<CR>", desc = "Open trouble location list" },
-- 		{ "<leader>xt", "<cmd>TodoTrouble<CR>", desc = "Open todos in trouble" },
-- 	},
-- 	config = function()
-- 		require("trouble").setup({
-- 			-- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
-- 			mode = "workspace_diagnostics",
-- 			position = "bottom", -- position of the list can be: bottom, top, left, right
-- 			height = 10,
-- 			padding = false,
-- 			action_keys = {
-- 				-- key mappings for actions in the trouble list
-- 				close = "q", -- close the list
-- 				cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
-- 				refresh = "r", -- manually refresh
-- 				jump = { "<cr>", "<tab>" }, -- jump to the diagnostic or open / close folds
-- 				open_split = { "<c-x>" }, -- open buffer in new split
-- 				open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
-- 				open_tab = { "<c-t>" }, -- open buffer in new tab
-- 				jump_close = { "o" }, -- jump to the diagnostic and close the list
-- 				toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
-- 				toggle_preview = "P", -- toggle auto_preview
-- 				hover = "K", -- opens a small popup with the full multiline message
-- 				preview = "p", -- preview the diagnostic location
-- 				close_folds = { "zM" }, -- close all folds
-- 				open_folds = { "zR" }, -- open all folds
-- 				toggle_fold = { "za" }, -- toggle fold of current file
-- 			},
-- 			auto_jump = {},
-- 			use_diagnostic_signs = true,
-- 		})
-- 	end,
-- }
return {
	{
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup({
				icons = false,
			})

			vim.keymap.set("n", "<leader>tt", function()
				require("trouble").toggle()
			end)

			vim.keymap.set("n", "[t", function()
				require("trouble").next({ skip_groups = true, jump = true })
			end)

			vim.keymap.set("n", "]t", function()
				require("trouble").previous({ skip_groups = true, jump = true })
			end)
		end,
	},
}
