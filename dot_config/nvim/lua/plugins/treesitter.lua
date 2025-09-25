return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            ensure_installed = { "dart", "lua", "vim", "json" },
            highlight = { enable = true },
            indent = { enable = true },
            auto_install = true,
        },
    },
    {
        "dart-lang/dart-vim-plugin",
        enabled = false
    }
}
