return {

    {
        "nvim-flutter/flutter-tools.nvim",
        lazy = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "stevearc/dressing.nvim", -- optional for vim.ui.select
        },
        opts = {
            ui = {
                notification_style = 'plugin'
            },
            decorations = {
                statusline = {
                    app_version = true,
                    device = true,
                }
            },
            debugger = {
                enabled = true,
            },
            flutter_path = "/usr/bin/flutter",
            lsp = {
                color = { -- show the derived colours for dart variables
                    enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
                    background = true, -- highlight the background
                    background_color = { r = 19, g = 17, b = 24 }, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
                    foreground = true, -- highlight the foreground
                    virtual_text = true, -- show the highlight using virtual text
                    virtual_text_str = "■", -- the virtual text character to highlight
                },
                settings = {
                    -- analysisExcludedFolders = {} -- really slow
                    -- analysisExcludedFolders = { "/opt/flutter/packages", "/opt/flutter/.pub-cache", "/home/mbuci/.cache/flutter_sdk/packages" } -- can't ignore cache or you get no debugging info
                    analysisExcludedFolders = { "/opt/flutter/packages", "/opt/flutter/.pub-cache", "/home/mbuci/repos/SubversesFlutterMVP/subverses_flutter/build" } -- can't ignore cache or you get no debugging info
                }
            }
        },
        closing_tags = {
            highlight = "ErrorMsg", -- highlight for the closing tag
            prefix = ">",           -- character to use for close tag e.g. > Widget
            priority = 10,          -- priority of virtual text in current line
            -- consider to configure this when there is a possibility of multiple virtual text items in one line
            -- see `priority` option in |:help nvim_buf_set_extmark| for more info
            enabled = true -- set to false to disable
        },
        keys = {
            { "<leader>Fd", "<cmd>FlutterDevices<cr>",                desc = "Flutter: List Devices" },
            { "<leader>Fe", "<cmd>FlutterEmulators<cr>",              desc = "Flutter: List Emulators" },
            { "<leader>Fr", "<cmd>FlutterRestart<cr>",                desc = "Flutter: Restart Project" },
            { "<leader>FR", "<cmd>FlutterRun<cr>",                    desc = "Flutter: Run Project" },
            { "<leader>Fq", "<cmd>FlutterQuit<cr>",                   desc = "Flutter: End Running Session" },
            { "<leader>Fl", "<cmd>FlutterLogToggle<cr>",              desc = "Flutter: Toggle Log" },
            { "<leader>FC", "<cmd>FlutterLogClear<cr>",               desc = "Flutter: Clear Log" },
            { "J",          "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "LSP Code Actions" },
        },
        enabled = true -- cannot coexist with nvim-lspconfig
    },
    {
        "mfussenegger/nvim-dap", -- debug flutter
        keys = {
            { "<leader>db", "<cmd>DapToggleBreakpoint<cr>", desc = "Toggle Breakpoint" },
            { "<leader>dB", "<cmd>DapClearBreakpoints<cr>", desc = "Clear Breakpoints" },
            { "<leader>dc", "<cmd>DapContinue<cr>",         desc = "Continue Executing" },
            { "<leader>dn", "<cmd>DapStepOver<cr>",         desc = "Step Over Current Line" },
            { "<leader>di", "<cmd>DapStepInto<cr>",         desc = "Step Into Current Expression" },
            { "<leader>do", "<cmd>DapStepOut<cr>",          desc = "Step Out Of Current Expression" },
            { "<leader>de", "<cmd>DapEval<cr>",             desc = "Open New Window for Evaluation" },
        }
    },
    {
        "igorlfs/nvim-dap-view", -- add debug view
        keys = {
            { "<leader>dv", "<cmd>DapViewToggle<cr>", desc = "Debug Adapter View Toggle" }
        }
    },
    {
        'nvim-flutter/pubspec-assist.nvim' -- easily add flutter dependencies
    },
    {
        "dart-lang/dart-vim-plugin", -- for dart syntax hightling
        enabled = false
    },
}
