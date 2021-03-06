require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "c",
        "cpp",
        "dockerfile",
        "dot",
        "go",
        "json",
        "lua",
        "make",
        "rust",
        "toml",
        "vim",
    },

    highlight = {
        enable = true,
    }
}
