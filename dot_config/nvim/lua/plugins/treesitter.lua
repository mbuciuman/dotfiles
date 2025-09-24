return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        ensure_installed = { "dart", "lua", "vim", "json" },
        highlight = { enable = true },
        indent = { enable = true },
    }
}
