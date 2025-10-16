local function get_wordcount()
    local word_count = 0

    if vim.fn.mode():find("[vV]") then
        word_count = vim.fn.wordcount().visual_words
    else
        word_count = vim.fn.wordcount().words
    end

    return word_count
end

local function wordcount()
    local label = "word"
    local word_count = get_wordcount()

    if word_count > 1 then
        label = label .. "s"
    end

    return word_count .. " " .. label
end

local function readingtime()
    -- 200 is about the average words read per minute.
    return tostring(math.ceil(get_wordcount() / 200.0)) .. " min"
end

local function is_prose()
    return vim.bo.filetype == "markdown" or vim.bo.filetype == "text"
end

local function location()
    -- This function existed in Lualine, I modified it to display the total
    -- number of selected characters spanning across multiple lines.
    local line = vim.fn.line(".")
    local col = vim.fn.charcol(".")

    local line_start = vim.fn.line("v")
    local line_end = vim.fn.line(".")

    if vim.fn.mode():find("[vV]") and line_end ~= line_start then
        return string.format("%d:%d:%d", line, col, vim.fn.wordcount().visual_chars)
    else
        return string.format("%d:%d", line, col)
    end
end

return {
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        init = function()
            -- sets global lualine
            vim.g.lualine_laststatus = 3
            if vim.fn.argc(-1) > 0 then
                -- set an empty statusline till lualine loads
                vim.o.statusline = " "
            else
                -- hide the statusline on the starter page
                vim.o.laststatus = 0
            end
        end,
        opts = function()
            -- PERF: we don't need this lualine require madness 🤷
            local lualine_require = require("lualine_require")
            lualine_require.require = require

            local icons = LazyVim.config.icons

            vim.o.laststatus = vim.g.lualine_laststatus

            local opts = {
                options = {
                    theme = "auto",
                    globalstatus = vim.o.laststatus == 3,
                    disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
                    section_separators = "",
                    component_separators = "",
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch" },

                    lualine_c = {
                        LazyVim.lualine.root_dir(),
                        {
                            "diagnostics",
                            symbols = {
                                error = icons.diagnostics.Error,
                                warn = icons.diagnostics.Warn,
                                info = icons.diagnostics.Info,
                                hint = icons.diagnostics.Hint,
                            },
                        },
                        { "filetype",                   icon_only = true, separator = "", padding = { left = 1, right = 0 } },
                        { LazyVim.lualine.pretty_path() },
                    },
                    lualine_x = {
                        Snacks.profiler.status(),
                        -- stylua: ignore
                        {
                            function() return require("noice").api.status.command.get() end,
                            cond = function()
                                return package.loaded["noice"] and
                                    require("noice").api.status.command.has()
                            end,
                            color = function() return { fg = Snacks.util.color("Statement") } end,
                        },
                        -- stylua: ignore
                        {
                            function() return require("noice").api.status.mode.get() end,
                            cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
                            color = function() return { fg = Snacks.util.color("Constant") } end,
                        },
                        -- stylua: ignore
                        {
                            function() return "  " .. require("dap").status() end,
                            cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
                            color = function() return { fg = Snacks.util.color("Debug") } end,
                        },
                        -- stylua: ignore
                        {
                            require("lazy.status").updates,
                            cond = require("lazy.status").has_updates,
                            color = function() return { fg = Snacks.util.color("Special") } end,
                        },
                        {
                            "diff",
                            symbols = {
                                added = icons.git.added,
                                modified = icons.git.modified,
                                removed = icons.git.removed,
                            },
                            source = function()
                                local gitsigns = vim.b.gitsigns_status_dict
                                if gitsigns then
                                    return {
                                        added = gitsigns.added,
                                        modified = gitsigns.changed,
                                        removed = gitsigns.removed,
                                    }
                                end
                            end,
                        },
                    },
                    lualine_y = {
                        { "progress", separator = " ",                  padding = { left = 1, right = 0 } },
                        { "location", padding = { left = 0, right = 1 } },
                    },
                    -- lualine_z = {
                    --     function()
                    --         return " " .. os.date("%R")
                    --     end,
                    -- },
                },
                extensions = { "neo-tree", "lazy", "fzf" },
            }

            -- do not add trouble symbols if aerial is enabled
            -- And allow it to be overriden for some buffer types (see autocmds)
            if vim.g.trouble_lualine and LazyVim.has("trouble.nvim") then
                local trouble = require("trouble")
                local symbols = trouble.statusline({
                    mode = "symbols",
                    groups = {},
                    title = false,
                    filter = { range = true },
                    format = "{kind_icon}{symbol.name:Normal}",
                    hl_group = "lualine_c_normal",
                })
                table.insert(opts.sections.lualine_c, {
                    symbols and symbols.get,
                    cond = function()
                        return vim.b.trouble_lualine ~= false and symbols.has()
                    end,
                })
            end

            return opts
        end,
    },
    -- opts = {
    -- 	sections = {
    -- 		lualine_y = {
    -- 			{ "progress", separator = " ", padding = { left = 1, right = 0 } },
    -- 			{ location, padding = { left = 0, right = 1 } },
    -- 		},
    -- 		-- Disable the default clock and replace it with word stats.
    -- 		lualine_z = {
    -- 			{ wordcount, cond = is_prose },
    -- 			{ readingtime, cond = is_prose },
    -- 		},
    -- 	},
    -- },
}
