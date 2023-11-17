require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { 'lua_ls', 'clangd', 'cssls', 'emmet_ls', 'html', 'tsserver', 'marksman', 'pyright', 'tailwindcss',
    'svelte' }
})

require('lspconfig').lua_ls.setup {}
require('lspconfig').clangd.setup {}
require('lspconfig').cssls.setup {}
require('lspconfig').emmet_ls.setup {}
require('lspconfig').html.setup {}
require('lspconfig').tsserver.setup {}
require('lspconfig').marksman.setup {}
require('lspconfig').pyright.setup { {
  filetypes = { 'python' }
} }
require('lspconfig').tailwindcss.setup {}
require('lspconfig').svelte.setup {}
