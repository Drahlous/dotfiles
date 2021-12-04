


-- Highlight on yank
--vim.api.nvim_exec(
--    [[
--    augroup YankHighlight
--        autocmd!
--        au TextYankPost * silent! lua vim.highlight.on_yank()
--    augroup END
--    ]],
--    false
--)
-- LSP config
require'lspconfig'.pyright.setup{}
require'lspconfig'.bashls.setup{}
require'lspconfig'.rust_analyzer.setup{}

