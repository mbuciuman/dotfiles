return {
	{
		"EdenEast/nightfox.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("nightfox").setup({
				options = {
					transparent = true,
					styles = {
						comments = "italic",
						keywords = "bold",
						types = "italic,bold",
					},
				},
				-- groups = {
				-- 	all = {
				-- 		telescopeborder = { fg = palette.fg3 },
				-- 	},
				-- 	nightfox = {
				-- 		visual = { bg = palette.bg1 },
				-- 	},
				-- },
			})
			-- load the colorscheme here
			vim.cmd([[colorscheme terafox]])
		end,
		opts = {
			options = {},
		},
	},
	{
		"xiyaowong/transparent.nvim",
		opts = {
			extra_groups = {
				"NormalFloat",
			},
		},
	},
	{
		"norcalli/nvim-colorizer.lua",
		enabled = false,
		opts = {
			"*",
		},
	},
	{
		"nvim-mini/mini.hipatterns",
		config = function()
			local hipatterns = require("mini.hipatterns")
			hipatterns.setup({
				highlighters = {
					-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
					fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
					hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
					todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
					note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

					-- Highlight hex color strings (`#rrggbb`) using that color
					hex_color = hipatterns.gen_highlighter.hex_color(),
				},
			})
		end,
	},
}
