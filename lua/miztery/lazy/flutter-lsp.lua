return {
    'nvim-flutter/flutter-tools.nvim',
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = function()
        require("flutter-tools").setup {
            lsp = {
                capabilities = require("cmp_nvim_lsp").default_capabilities(),
                flags = { allow_incremental_sync = false },
                on_attach = function(client, bufnr)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
                end,
            },
        }
    end,
}
