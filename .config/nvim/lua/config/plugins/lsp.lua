local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = { 'gopls' },
})

-- Function to setup common LSP configurations
local function on_attach(client, bufnr)
  -- Enable signature help
  require("lsp_signature").on_attach({
    bind = true,
    handler_opts = {
      border = "rounded"
    },
    hint_enable = true,
  }, bufnr)
end

-- Setup your LSP servers
lspconfig.gopls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    gopls = {
      hints = {
        parameterNames = true,
        functionTypeParameters = true,
        constantValues = true,
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
      },
    },
  },
})
