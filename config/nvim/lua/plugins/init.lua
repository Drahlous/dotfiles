return {
    -- Frameworks
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",


    -- Treesitter
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate", name = "nvim-treesitter"},
    {"nvim-treesitter/nvim-treesitter-context", dependencies = {"nvim-treesitter"}},
    {"nvim-treesitter/playground", cmd = "TSPlaygroundToggle", dependencies = {"nvim-treesitter"}},

    -- Aerial
    "stevearc/aerial.nvim",

    -- Comment
    "numToStr/Comment.nvim",

    -- Language Server
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "jose-elias-alvarez/null-ls.nvim",

    -- Autocompletion
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-cmdline",

    -- Snippets
    "L3MON4D3/LuaSnip",

    "VonHeikemen/lsp-zero.nvim",

    -- Debug Adapter
    "mfussenegger/nvim-dap",

    -- Wikilinks
    "mmai/wikilink",

    -- Git
    "tpope/vim-fugitive",

    -- Webdev Filetype Icons
    "nvim-tree/nvim-web-devicons",
}
