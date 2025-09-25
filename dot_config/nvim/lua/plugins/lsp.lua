return {
	-- LSP Configuration
	{
		"neovim/nvim-lspconfig",
	},

	-- Debug Adapter Configuration
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = { "mfussenegger/nvim-dap" },
		opts = {
			ensure_installed = { "dart" },
		},
	},
}
