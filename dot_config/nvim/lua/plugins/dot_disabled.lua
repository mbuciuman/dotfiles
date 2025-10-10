return {
    { "tpope/vim-fugitive",                  enabled = false },
    { "scrooloose/syntastic",                enabled = false },
    { "vim-airline/vim-airline",             enabled = false },
    { "vimwiki/vimwiki",                     enabled = false },
    { "lukas-reineke/indent-blankline.nvim", enabled = false },
    {
        "hrsh7th/nvim-cmp",
        enabled = false,
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                }, {
                    { name = "buffer" },
                    { name = "path" },
                }),
            })
        end,
    },
    {
        "akinsho/bufferline.nvim",
        enabled = true,
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
    },
    {
        "nvim-tree/nvim-tree.lua",
        enabled = false,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = {
            { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree" },
        },
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        enabled = false,
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- icons
            "MunifTanjim/nui.nvim",
        },
        lazy = false,
        --cmd = "Neotree",
        keys = {
            -- Toggle file explorer
            { "<leader>e",  "<cmd>Neotree toggle<cr>", desc = "Explorer NeoTree (root dir)" },
            -- Focus on current file in tree
            { "<leader>fe", "<cmd>Neotree focus<cr>",  desc = "Focus NeoTree" },
        },
        opts = {
            close_if_last_window = true,
            popup_border_style = "rounded",
            enable_git_status = true,
            enable_diagnostics = true,
            filesystem = {
                hijack_netrw_behavior = "open_default",
                filtered_items = {
                    hide_dotfiles = false,
                    hide_gitignored = true,
                },
                follow_current_file = { enabled = true }, -- auto-focus current file
                group_empty_dirs = true,
            },
            window = {
                position = "left",
                width = 35,
                mappings = {
                    ["<space>"] = "none", -- disable space expand
                },
            },
            event_handlers = {
                {
                    event = "neo_tree_buffer_enter",
                    handler = function()
                        vim.cmd("setlocal number relativenumber")
                    end,
                },
            },
        },
    },
}
