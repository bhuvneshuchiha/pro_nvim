return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = "make install_jsregexp",
			dependencies = { "rafamadriz/friendly-snippets" },
		},
		"saadparwaiz1/cmp_luasnip",
		"j-hui/fidget.nvim",
	},
	config = function()
		local cmp = require("cmp")
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)

		local keymap = vim.keymap -- for conciseness

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf, silent = true }

				-- set keybinds
				opts.desc = "Show LSP references"
				keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

				opts.desc = "Go to declaration"
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

				opts.desc = "Show LSP definitions"
				keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

				opts.desc = "Show LSP implementations"
				keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

				opts.desc = "Show LSP type definitions"
				keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

				opts.desc = "Smart rename"
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

				opts.desc = "Show buffer diagnostics"
				keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

				opts.desc = "Show line diagnostics"
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

				opts.desc = "Go to previous diagnostic"
				keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

				opts.desc = "Go to next diagnostic"
				keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
			end,
		})
		require("fidget").setup({})
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"pylsp",
				"clangd",
				"tsserver",
			},
			handlers = {
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,

				["lua_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								runtime = { version = "Lua 5.1" },
								diagnostics = {
									globals = { "vim", "it", "describe", "before_each", "after_each" },
								},
							},
						},
					})
				end,
				["pylsp"] = function()
					-- configure pylsp server
					local lspconfig = require("lspconfig")
					lspconfig["pylsp"].setup({
						capabilities = capabilities,
						settings = {
							pylsp = {
								plugins = {
									jedi_completion = {
										include_params = true,
									},
									mccabe = { enabled = false },
									pylint = { enabled = true },
									pyflakes = { enabled = false },
									pycodestyle = { enabled = false },
								},
							},
						},
					})
				end,

				-- ["svelte"] = function()
				-- 	-- configure svelte server
				-- 	local lspconfig = require("lspconfig")
				-- 	lspconfig["svelte"].setup({
				-- 		capabilities = capabilities,
				-- 		on_attach = function(client, bufnr)
				-- 			vim.api.nvim_create_autocmd("BufWritePost", {
				-- 				pattern = { "*.js", "*.ts" },
				-- 				callback = function(ctx)
				-- 					-- Here use ctx.match instead of ctx.file
				-- 					client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
				-- 				end,
				-- 			})
				-- 		end,
				-- 	})
				-- end,
				--
				-- ["graphql"] = function()
				-- 	-- configure graphql language server
				-- 	local lspconfig = require("lspconfig")
				-- 	lspconfig["graphql"].setup({
				-- 		capabilities = capabilities,
				-- 		filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
				-- 	})
				-- end,
				["emmet_ls"] = function()
					-- configure emmet language server
					local lspconfig = require("lspconfig")
					lspconfig["emmet_ls"].setup({
						capabilities = capabilities,
						filetypes = {
							"html",
							"typescriptreact",
							"javascriptreact",
							"css",
							"sass",
							"scss",
							"less",
							"svelte",
						},
					})
				end,

				["clangd"] = function()
					-- configure emmet language server
					local lspconfig = require("lspconfig")
					lspconfig["clangd"].setup({
						showOrigin = false,
						capabilities = capabilities,
						filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
					})
				end,
			},
		})

		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		local kind_icons = {
			Text = "",
			Method = "󰆧",
			Function = "󰊕",
			Constructor = "",
			Field = "󰇽",
			Variable = "󰂡",
			Class = "󰠱",
			Interface = "",
			Module = "",
			Property = "󰜢",
			Unit = "",
			Value = "󰎠",
			Enum = "",
			Keyword = "󰌋",
			Snippet = "",
			Color = "󰏘",
			File = "󰈙",
			Reference = "",
			Folder = "󰉋",
			EnumMember = "",
			Constant = "󰏿",
			Struct = "",
			Event = "",
			Operator = "󰆕",
			TypeParameter = "󰅲",
		}
		local luasnip = require("luasnip")
		require("luasnip.loaders.from_vscode").lazy_load()
		luasnip.config.setup({})
		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			experimental = {
				ghost_text = true,
			},
    -- Un comment to auto select the first item in Autocompletion
			-- completion = {
			-- 	completeopt = "menu,menuone,noinsert",
			-- },
			window = {
				-- completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
				-- documentation = cmp.config.disable,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete({}),
				["<Tab>"] = cmp.mapping.confirm({ select = true }), -- Autocompletion on Tab
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = false, --Set true to make enter key select the first Autocompletion
				}),
			}),
			formatting = {
				format = function(entry, vim_item)
					local lspkind_ok, lspkind = pcall(require, "lspkind")
					if not lspkind_ok then
						-- From kind_icons array
						vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
						-- Source
						vim_item.menu = ({
							nvim_lsp = "[LSP]",
							nvim_lua = "[Lua]",
							luasnip = "[LuaSnip]",
							buffer = "[Buffer]",
							latex_symbols = "[LaTeX]",
						})[entry.source.name]
						-- vim_item.menu = ({
						-- 	nvim_lsp = "",
						-- 	nvim_lua = "",
						-- 	luasnip = "",
						-- 	buffer = "",
						-- 	latex_symbols = "",
						-- })[entry.source.name]
						return vim_item
					else
						-- From lspkind
						return lspkind.cmp_format()(entry, vim_item)
					end
				end,
			},

			sources = cmp.config.sources({
				-- { name = "nvim_lsp", max_item_count = 10 },
				-- { name = "luasnip", max_item_count = 10 }, -- For luasnip users.
				-- { name = "buffer", max_item_count = 10 },
				-- { name = "path", max_item_count = 10 },
				{ name = "nvim_lsp"},
				{ name = "luasnip"}, -- For luasnip users.
				{ name = "buffer"},
				{ name = "path"},
				-- { name = "treesitter" },
				-- { name = "tmux" },
			}),
		})

		vim.diagnostic.config({
			-- update_in_insert = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})
	end,
}
