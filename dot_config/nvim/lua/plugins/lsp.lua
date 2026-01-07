return {
    -- LSP Configuration
    {
        'neovim/nvim-lspconfig',
        opts = {
            servers = {
                dartls = {
                    -- Additional dartls config (optional)
                    settings = {
                        dart = {
                            enableSdkFormatter = true,
                            lineLength = 100,
                        },
                    },
                },
            },
        },
        enabled = true -- cannot coexist with flutter-tools
    },
    {
        "folke/which-key.nvim",
        keys = {
            -- disable the keymap as it breaks the bound lsp subcommands under gr<key>
            { "gr", false },
        },
    },
    -- Debug Adapter Configuration
    {
        "mason-org/mason.nvim",
        opts = {},
        enabled = true
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = { "mfussenegger/nvim-dap" },
        opts = {
            ensure_installed = { "dart" },
        },
        enabled = true
    },
}
