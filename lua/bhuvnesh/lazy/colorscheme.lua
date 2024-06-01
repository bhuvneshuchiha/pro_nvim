-- return {
-- 	"folke/tokyonight.nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		local transparent = true -- set to true if you would like to enable transparency
--
-- 		require("tokyonight").setup({
-- 			-- your configuration comes here
-- 			-- or leave it empty to use the default settings
-- 			style = "moon", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
-- 			light_style = "day", -- The theme is used when the background is set to light
-- 			transparent = true, -- Enable this to disable setting the background color
-- 			disable_background = false,
-- 			terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
-- 			styles = {
-- 				-- Style to be applied to different syntax groups
-- 				-- Value is any valid attr-list value for `:help nvim_set_hl`
-- 				comments = { italic = false, bold = false },
-- 				keywords = { italic = false, bold = false },
-- 				functions = {},
-- 				variables = {},
-- 				-- Background styles. Can be "dark", "transparent" or "normal"
-- 				sidebars = "transparent", -- style for sidebars, see below
-- 				floats = "transparent", -- style for floating windows
-- 			},
-- 			sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
-- 			day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
-- 			hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
-- 			dim_inactive = false, -- dims inactive windows
-- 			lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
--
-- 			--- You can override specific color groups to use other groups or a hex color
-- 			--- function will be called with a ColorScheme table
-- 			-- ---@param colors ColorScheme
-- 			-- on_colors = function(colors)
-- 			--   colors.hint = colors.cyan
-- 			-- end,
-- 			-- --- You can override specific highlights to use other groups or a hex color
-- 			-- --- function will be called with a Highlights and ColorScheme table
-- 			-- ---@param highlights Highlights
-- 			-- ---@param colors ColorScheme
-- 			-- on_highlights = function(hl, c) end,
-- 		})
-- 		vim.cmd("colorscheme tokyonight")
-- 	end,
-- }
--
-- return {
-- 	"ellisonleao/gruvbox.nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		require("gruvbox").setup({
-- 			terminal_colors = true, -- add neovim terminal colors
-- 			undercurl = true,
-- 			underline = true,
-- 			bold = true,
-- 			italic = {
-- 				strings = false,
-- 				emphasis = false,
-- 				comments = false,
-- 				operators = false,
-- 				folds = false,
-- 			},
-- 			strikethrough = true,
-- 			invert_selection = false,
-- 			invert_signs = false,
-- 			invert_tabline = false,
-- 			invert_intend_guides = false,
-- 			inverse = true, -- invert background for search, diffs, statuslines and errors
-- 			contrast = "", -- can be "hard", "soft" or empty string
-- 			palette_overrides = {},
-- 			overrides = {},
-- 			dim_inactive = false,
-- 			transparent_mode = true,
-- 		})
-- 		vim.o.background = "dark" -- or "light" for light mode
-- 		vim.cmd("colorscheme gruvbox")
-- 	end,
-- }
--
-- return {
-- 	"rose-pine",
-- 	priority = 1000,
-- 	config = function()
-- 		require("rose-pine").setup({
--
-- 			styles = {
-- 				bold = false,
-- 				italic = false,
-- 				transparency = true,
-- 			},
-- 		})
--
-- 		vim.cmd.colorscheme("rose-pine")
-- 	end,
-- }

-- return {
--   "folke/tokyonight.nvim",
--   priority = 1000,
--   config = function()
--     local transparent = false -- set to true if you would like to enable transparency
--
--     local bg = "#011628"
--     local bg_dark = "#011423"
--     local bg_highlight = "#143652"
--     local bg_search = "#0A64AC"
--     local bg_visual = "#275378"
--     local fg = "#CBE0F0"
--     local fg_dark = "#B4D0E9"
--     local fg_gutter = "#627E97"
--     local border = "#547998"
--
--     require("tokyonight").setup({
--       style = "night",
--       transparent = transparent,
--       styles = {
--         sidebars = transparent and "transparent" or "dark",
--         floats = transparent and "transparent" or "dark",
--       },
--       on_colors = function(colors)
--         colors.bg = bg
--         colors.bg_dark = transparent and colors.none or bg_dark
--         colors.bg_float = transparent and colors.none or bg_dark
--         colors.bg_highlight = bg_highlight
--         colors.bg_popup = bg_dark
--         colors.bg_search = bg_search
--         colors.bg_sidebar = transparent and colors.none or bg_dark
--         colors.bg_statusline = transparent and colors.none or bg_dark
--         colors.bg_visual = bg_visual
--         colors.border = border
--         colors.fg = fg
--         colors.fg_dark = fg_dark
--         colors.fg_float = fg
--         colors.fg_gutter = fg_gutter
--         colors.fg_sidebar = fg_dark
--       end,
--     })
--
--     vim.cmd("colorscheme tokyonight")
--   end,
-- }
-- return {
--   "sainnhe/sonokai",
--   priority = 1000,
--   config = function()
--     vim.g.sonokai_transparent_background = "1"
--     vim.g.sonokai_enable_italic = "0"
--     vim.g.sonokai_style = "andromeda"
--     vim.cmd.colorscheme("sonokai")
--   end,
-- }

-- return {
--   "catppuccin/nvim",
--   name = "catppuccin",
--   priority = 1000,
--   lazy = false,
--   config = function()
--     local catppuccin = require("catppuccin")
--     local palettes = require("catppuccin.palettes")
--     local mocha = palettes.get_palette("mocha")
--
--     catppuccin.setup({
--       flavour = "mocha",
--       compile = { enabled = true, path = vim.fn.stdpath("cache") .. "/catppuccin" },
--       transparent_background = true,
--       term_colors = false,
--       integrations = {
--         aerial = false,
--         bufferline = true,
--         cmp = true,
--         dap = { enabled = true, enable_ui = true },
--         gitsigns = true,
--         lsp_trouble = true,
--         markdown = false,
--         mason = true,
--         mini = true,
--         native_lsp = { enabled = true },
--         notify = true,
--         rainbow_delimiters = true,
--         semantic_tokens = true,
--         telescope = true,
--         treesitter = true,
--         which_key = true,
--       },
--       highlight_overrides = {
--         mocha = {
--           DiagnosticVirtualTextError = { bg = mocha.base, style = {} },
--           DiagnosticVirtualTextWarn = { bg = mocha.base, style = {} },
--           DiagnosticVirtualTextInfo = { bg = mocha.base, style = {} },
--           DiagnosticVirtualTextHint = { bg = mocha.base, style = {} },
--           DiagnosticFloatingError = { bg = mocha.base, style = {} },
--           DiagnosticFloatingWarn = { bg = mocha.base, style = {} },
--           DiagnosticFloatingInfo = { bg = mocha.base, style = {} },
--           DiagnosticFloatingHint = { bg = mocha.base, style = {} },
--         },
--       },
--     })
--
--     -- vim.g.catppuccin_flavour = "macchiato"
--     vim.cmd([[colorscheme catppuccin]])
--
--     vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })
--     vim.api.nvim_set_hl(0, "LspInlayHint", { link = "Comment" })
--   end,
-- }

function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)
end

return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				disable_background = true,
				styles = {
					bold = true,
					italic = false,
					transparency = true,
				},
				highlight_groups = {
					Cursor = { fg = "black", bg = "#ffffff" }, -- Cursor color white
				},
			})

			vim.cmd("colorscheme rose-pine")
			ColorMyPencils()
		end,
	},
}
--
-- return {
--   "rebelot/kanagawa.nvim", -- Repositorio del colorscheme
--   lazy = false,
--   priority = 1000, -- Cargar este plugin antes que el resto
--   config = function()
--     require("kanagawa").setup({
--       compile = false, -- enable compiling the colorscheme
--       undercurl = true, -- enable undercurls
--       commentStyle = { italic = true },
--       functionStyle = {},
--       keywordStyle = { italic = true },
--       statementStyle = { bold = false },
--       typeStyle = {},
--       transparent = true, -- do not set background color
--       dimInactive = false, -- dim inactive window `:h hl-NormalNC`
--       terminalColors = true, -- define vim.g.terminal_color_{0,17}
--       colors = { -- add/modify theme and palette colors
--         palette = {},
--         theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
--       },
--       overrides = function(colors) -- add/modify highlights
--         return {}
--       end,
--       theme = "wave", -- Load "wave" theme when 'background' option is not set
--       background = { -- map the value of 'background' option to a theme
--         dark = "wave", -- try "dragon" !
--         light = "lotus",
--       },
--     }) -- Carga el colorscheme automáticamente
--     vim.cmd("colorscheme kanagawa-dragon") -- El colorscheme a utilizar
--   end,
-- }
-- return {
--   "notken12/base46-colors",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     -- Carga el colorscheme automáticamente
--     vim.cmd("colorscheme ayu_dark") -- El colorscheme a utilizar
--   end,
-- }

-- Se ocupa un colorscheme personalizado, bajo el directorio de themes/. Lo que hará este colorscheme
-- será suplir los espacios vacios donde el highlighting personalizado no cumple.
