-- conform.lua

-- Set up formatters by filetype
require("conform").setup({
    formatters_by_ft = {
        typescript = {'prettier'},
        typescriptreact = {'prettier'},
        javascript = {'prettier'},
        javascriptreact = {'prettier'},
        json = {'prettier'},
        html = {'prettier'},
        css = {'prettier'},
        scss = {'prettier'},
        markdown = {'prettier'},
        yaml = {'prettier'},
        sh = {'beautysh'},
        zsh = {'beautysh'},
    },
})

-- Format on save autocmd
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
        require("conform").format({ bufnr = args.buf })
    end,
})

-- Set up format-on-save autocmd using Conform
require("conform").setup({
    format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
    },
})

-- Set up formatexpr for Conform
vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

-- View configured and available formatters, as well as the log file
-- Run :ConformInfo in Neovim

