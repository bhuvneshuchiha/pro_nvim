--return {
-- 	"hrsh7th/nvim-cmp",
-- 	event = "InsertEnter",
-- 	dependencies = {
-- 		"hrsh7th/cmp-buffer", -- source for text in buffer
-- 		"hrsh7th/cmp-path", -- source for file system paths
-- 		{
-- 			"L3MON4D3/LuaSnip",
-- 			-- follow latest release.
-- 			version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
-- 			-- install jsregexp (optional!).
-- 			build = "make install_jsregexp",
-- 		},
-- 		"saadparwaiz1/cmp_luasnip", -- for autocompletion
-- 		--"rafamadriz/friendly-snippets", -- useful snippets
-- 		"onsails/lspkind.nvim", -- vs-code like pictograms
-- 	},
-- 	config = function()
-- 		local cmp = require("cmp")
--
-- 		local luasnip = require("luasnip")
--
-- 		local lspkind = require("lspkind")
--
-- 		-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
-- 		require("luasnip.loaders.from_vscode").lazy_load()
--
-- 		cmp.setup({
-- 			completion = {
-- 				completeopt = "menu,menuone,preview,noinsert",
-- 			},
-- 			snippet = { -- configure how nvim-cmp interacts with snippet engine
-- 				expand = function(args)
-- 					luasnip.lsp_expand(args.body)
-- 				end,
-- 			},
-- 			mapping = cmp.mapping.preset.insert({
-- 				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
-- 				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
-- 				["<C-b>"] = cmp.mapping.scroll_docs(-4),
-- 				["<C-f>"] = cmp.mapping.scroll_docs(4),
-- 				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
-- 				["<C-e>"] = cmp.mapping.abort(), -- close completion window
-- 				["<CR>"] = cmp.mapping.confirm({ select = false }),
-- 			}),
-- 			-- sources for autocompletion
-- 			sources = cmp.config.sources({
-- 				{ name = "nvim_lsp" },
-- 				--{ name = "luasnip" }, -- snippets
-- 				{ name = "buffer" }, -- text within current buffer
-- 				{ name = "path" }, -- file system paths
-- 			}),
--
-- 			-- configure lspkind for vs-code like pictograms in completion menu
-- 			formatting = {
-- 				format = lspkind.cmp_format({
-- 					mode = "symbol",
-- 					maxwidth = 25,
-- 					ellipsis_char = "...",
-- 					show_labelDetails = true, -- show labelDetails in menu. Disabled by default
-- 				}),
-- 			},
-- 		})
-- 	end,
-- }

return {
	-- Autocompletion
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		-- Snippet Engine & its associated nvim-cmp source
		"j-hui/fidget.nvim",
		"hrsh7th/cmp-cmdline",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-buffer",
		-- Adds LSP completion capabilities
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",

		-- Adds a number of user-friendly snippets
		"rafamadriz/friendly-snippets",

		-- Adds vscode-like pictograms
		"onsails/lspkind.nvim",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")
		require("fidget").setup({})

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
		require("luasnip.loaders.from_vscode").lazy_load()
		luasnip.config.setup({})

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			experimental = {
				ghost_text = true,
			},
			completion = {
				completeopt = "menu,menuone,noinsert",
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
					select = true,
				}),
				-- 	["<Tab>"] = cmp.mapping(function(fallback)
				-- 		if cmp.visible() then
				-- 			cmp.select_next_item()
				-- 		elseif luasnip.expand_or_locally_jumpable() then
				-- 			luasnip.expand_or_jump()
				-- 		else
				-- 			fallback()
				-- 		end
				-- 	end, { "i", "s" }),
				-- 	["<S-Tab>"] = cmp.mapping(function(fallback)
				-- 		if cmp.visible() then
				-- 			cmp.select_prev_item()
				-- 		elseif luasnip.locally_jumpable(-1) then
				-- 			luasnip.jump(-1)
				-- 		else
				-- 			fallback()
				-- 		end
				-- 	end, { "i", "s" }),
			}),
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.disable,
				--documentation = cmp.config.window.bordered(),
			},
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
				--{ name = "calc" },
				--{ name = "emoji" },
				{ name = "treesitter" },
				--{ name = "crates" },
				{ name = "tmux" },
			},

			-- formatting = {
			-- 	format = function(entry, item)
			-- 		item.kind = kind_icons[item.kind]
			-- 		item.menu = ({
			-- 			buffer = "[Buffer]",
			-- 			nvim_lsp = "[LSP]",
			-- 			luasnip = "[Snippet]",
			-- 		})[entry.source.name]
			--
			-- 		return item
			-- 	end,
			-- },
			-- 	formatting = {
			-- 		format = function(entry, vim_item)
			-- 			local lspkind_ok, lspkind = pcall(require, "lspkind")
			-- 			if not lspkind_ok then
			-- 				-- From kind_icons array
			-- 				vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
			-- 				-- Source
			-- 				vim_item.menu = ({
			-- 					nvim_lsp = "[LSP]",
			-- 					nvim_lua = "[Lua]",
			-- 					luasnip = "[LuaSnip]",
			-- 					buffer = "[Buffer]",
			-- 					latex_symbols = "[LaTeX]",
			-- 				})[entry.source.name]
			-- 				return vim_item
			-- 			else
			-- 				-- From lspkind
			-- 				return lspkind.cmp_format()(entry, vim_item)
			-- 			end
			-- 		end,
			-- 	},
		})
	end,
}
