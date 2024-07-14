return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	-- cmd = "Neotree",
	-- init = function()
	-- 	vim.api.nvim_create_autocmd("BufEnter", {
	-- 		-- make a group to be able to delete it later
	-- 		group = vim.api.nvim_create_augroup("NeoTreeInit", { clear = true }),
	-- 		callback = function()
	-- 			local f = vim.fn.expand("%:p")
	-- 			if vim.fn.isdirectory(f) ~= 0 then
	-- 				vim.cmd("Neotree current dir=" .. f)
	-- 				-- neo-tree is loaded now, delete the init autocmd
	-- 				vim.api.nvim_clear_autocmds({ group = "NeoTreeInit" })
	-- 			end
	-- 		end,
	-- 	})
	-- end,
	--event = "VeryLazy",
	lazy = false, -- To do fast loading to prevent netrw flash.
	keys = {
		{ "<leader>e", ":Neotree toggle float<CR>", silent = true, desc = "Float File Explorer" },
		{ "<leader><tab>", ":Neotree toggle left<CR>", silent = true, desc = "Left File Explorer" },
	},
	config = function()
		require("neo-tree").setup({
			close_if_last_window = true,
			popup_border_style = "single",
			enable_git_status = true,
			enable_modified_markers = true,
			enable_diagnostics = true,
			sort_case_insensitive = true,
			default_component_configs = {
				indent = {
					with_markers = true,
					with_expanders = true,
				},
				modified = {
					symbol = " ",
					highlight = "NeoTreeModified",
				},
				icon = {
					folder_closed = "",
					folder_open = "",
					folder_empty = "",
					folder_empty_open = "",
				},
				git_status = {
					symbols = {
						-- Change type
						added = "",
						deleted = "",
						modified = "",
						renamed = "",
						-- Status type
						untracked = "",
						ignored = "",
						unstaged = "",
						staged = "",
						conflict = "",
					},
				},
			},
			window = {
				position = "float",
				width = 30,
			},
			filesystem = {
				--	hijack_netrw_behavior = "open_current",
				hijack_netrw_behavior = "disabled", -- Comment to use neo-tree as main file exp.
				use_libuv_file_watcher = true,
				filtered_items = {
					hide_dotfiles = false,
					hide_gitignored = false,
					hide_by_name = {
						"node_modules",
					},
					never_show = {
						".DS_Store",
						"thumbs.db",
					},
				},
			},
			source_selector = {
				winbar = true,
				sources = {
					{ source = "filesystem", display_name = "   Files " },
					{ source = "buffers", display_name = "   Bufs " },
					{ source = "git_status", display_name = "   Git " },
				},
			},
			event_handlers = {
				{
					event = "neo_tree_window_after_open",
					handler = function(args)
						if args.position == "left" or args.position == "right" then
							vim.cmd("wincmd =")
						end
					end,
				},
				{
					event = "neo_tree_window_after_close",
					handler = function(args)
						if args.position == "left" or args.position == "right" then
							vim.cmd("wincmd =")
						end
					end,
				},
                -- To close neo tree when open file
				{
					event = "file_opened",
					handler = function(file_path)
						-- auto close
						-- vimc.cmd("Neotree close")
						-- OR
						require("neo-tree.command").execute({ action = "close" })
					end,
				},
			},
		})
	end,
}
