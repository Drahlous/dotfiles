local null_ls = require("null-ls")

local sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.completion.spell,
    -- Python Styling
    null_ls.builtins.diagnostics.pydocstyle,
    null_ls.builtins.diagnostics.pylint,
    null_ls.builtins.formatting.black,
}

null_ls.setup({
    sources = sources,
})
