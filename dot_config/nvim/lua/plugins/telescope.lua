return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").setup()
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
            vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
        end,
    },
    {
        'nvim-telescope/telescope-project.nvim',
        dependencies = {
            'nvim-telescope/telescope.nvim',
        },
        opts = {
            extensions = {
                project = {
                    mappings = {
                        -- broken config
                        -- n = {
                        --     ['<leader>Pd'] = project_actions.delete_project,
                        --     ['<leader>Pr'] = project_actions.rename_project,
                        --     ['<leader>Pc'] = project_actions.add_project,
                        --     ['<leader>PC'] = project_actions.add_project_cwd,
                        --     ['<leader>Pf'] = project_actions.find_project_files,
                        --     ['<leader>Pb'] = project_actions.browse_project_files,
                        --     ['<leader>Ps'] = project_actions.search_in_project_files,
                        --     ['<leader>PR'] = project_actions.recent_project_files,
                        --     ['<leader>Pw'] = project_actions.change_working_directory,
                        --     ['<leader>Po'] = project_actions.next_cd_scope,
                        -- },
                        -- i = {
                        --     ['<c-d>'] = project_actions.delete_project,
                        --     ['<c-v>'] = project_actions.rename_project,
                        --     ['<c-a>'] = project_actions.add_project,
                        --     ['<c-A>'] = project_actions.add_project_cwd,
                        --     ['<c-f>'] = project_actions.find_project_files,
                        --     ['<c-b>'] = project_actions.browse_project_files,
                        --     ['<c-s>'] = project_actions.search_in_project_files,
                        --     ['<c-r>'] = project_actions.recent_project_files,
                        --     ['<c-l>'] = project_actions.change_working_directory,
                        --     ['<c-o>'] = project_actions.next_cd_scope,
                        -- }
                    }
                }
            }
        },
        enabled = false

    }
}
