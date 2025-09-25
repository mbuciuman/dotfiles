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
}
