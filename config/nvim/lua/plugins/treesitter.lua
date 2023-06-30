return {
    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        name = "nvim-treesitter",
        build = ":TSUpdate",
        cmd = {"TSUpdateSync"},
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            -- A list of parser names, or "all" (the four listed parsers should always be installed)
            ensure_installed = {
                "c",
                "lua",
                "vim",
                "python",
                "markdown",
                "markdown_inline"
            },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = true,
                disable = { 'python' }
            },
        },
        config = function(_, opts)
            if type(opts.ensure_installed) == "table" then
                ---@type table<string, boolean>
                local added = {}
                opts.ensure_installed = vim.tbl_filter(function(lang)
                    if added[lang] then
                        return false
                    end
                    added[lang] = true
                    return true
                end, opts.ensure_installed)
            end
            require("nvim-treesitter.configs").setup(opts)
        end,
    },

    -- Treesitter Context
    {
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = {"nvim-treesitter"},
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
            max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
            min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
            line_numbers = true,
            multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
            trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
            mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
            -- Separator between context and content. Should be a single character string, like '-'.
            -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
            separator = nil,
            zindex = 20, -- The Z-index of the context window
        }
    },
    -- Treesitter Playground
    {
        "nvim-treesitter/playground",
        cmd = "TSPlaygroundToggle",
        dependencies = {"nvim-treesitter"}
    },
}
