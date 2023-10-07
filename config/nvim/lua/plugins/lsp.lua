return {
    -- Lsp Zero
    {
        -- Configuration inspired by https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/guides/lazy-loading-with-lazy-nvim.md
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        config = function()
            require('lsp-zero.settings').preset("recommended")
        end,
    },

    -- Mason
    { "williamboman/mason.nvim", },
    { "williamboman/mason-lspconfig.nvim" },

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            {'L3MON4D3/LuaSnip'},
        },
        config = function()
            -- Here is where you configure the autocompletion settings.
            -- The arguments for .extend() have the same shape as `manage_nvim_cmp`: 
            -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/api-reference.md#manage_nvim_cmp

            require('lsp-zero.cmp').extend()

            -- And you can configure cmp even more, if you want to.
            local cmp = require('cmp')
            local cmp_action = require('lsp-zero.cmp').action()

            cmp.setup({
                mapping = {
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
                }
            })
        end
    },

    { "saadparwaiz1/cmp_luasnip" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-nvim-lua" },
    { "hrsh7th/cmp-cmdline" },

    -- Nvim Lsp Config
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            {'hrsh7th/cmp-nvim-lsp'},
            {'williamboman/mason-lspconfig.nvim'},
            {'williamboman/mason.nvim'},
        },
        config = function()
            -- This is where all the LSP shenanigans will live

            local lsp = require('lsp-zero')

            lsp.on_attach(function(_, bufnr)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                lsp.default_keymaps({buffer = bufnr})
            end)

            -- (Optional) Configure lua language server for neovim
            require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

            -- Automatic installation detailed at https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/lsp.md#automatic-installs
            lsp.ensure_installed({
                'clangd',
                'pyright',
                'lua_ls',
                'gopls',
                'bashls',
                'ansiblels',
                'jsonls',
                'marksman',
            })

            lsp.setup()
        end
    },

    -- None LS (community managed version of null-ls)
    {
        "nvimtools/none-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = function()
            local null_ls = require("null-ls")
            return {
                sources = {
                    null_ls.builtins.formatting.stylua,
                    -- Python Styling
                    null_ls.builtins.diagnostics.pydocstyle.with({
                        method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
                    }),
                    null_ls.builtins.diagnostics.pylint.with({
                        method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
                    }),
                    null_ls.builtins.formatting.black.with({
                        extra_args = {
                            "--line-length",
                            "150",
                        },
                    }),
                    null_ls.builtins.formatting.isort.with({
                        extra_args = {
                            "--profile",
                            "black",
                            "--line-length",
                            "150",
                        },
                    }),
                },
            }
        end,
    },

    -- Aerial
    {
        "stevearc/aerial.nvim",
        event = { "BufReadPre", "BufNewFile" },
        cmd = { "AerialToggle", "AerialOpen", "AerialNavToggle", "AerialNavOpen" },
        opts = {},
    },
}
