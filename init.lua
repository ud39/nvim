require('base')

vim.cmd([[
augroup CLClear
    autocmd!
    autocmd ColorScheme * highlight clear CursorLine
augroup END
]])

local lspconfig = require('lspconfig')

lspconfig.hls.setup{
  cmd = { "haskell-language-server-wrapper", "--lsp" },
  filetypes = { "haskell" },
  root_dir = lspconfig.util.root_pattern("*.cabal", "stack.yaml", "cabal.project"),
  settings = {
    haskell = {
      languageServerHaskell = {
        formattingProvider = "fourmolu"
      }
    }
  }
}
