return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup()
        end,
    },
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("bufferline").setup()
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        enabled = false,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("nvim-tree").setup()
            vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })
        end,
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
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
            { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Explorer NeoTree (root dir)" },
            -- Focus on current file in tree
            { "<leader>fe", "<cmd>Neotree focus<cr>", desc = "Focus NeoTree" },
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
    }
}
