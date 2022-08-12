require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "c",
        "cpp",
        "dockerfile",
        "dot",
        "go",
        "lua",
        "make",
        "rust",
        "vim",
    },

    highlight = {
        enable = true,
    }
}
