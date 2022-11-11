local mason_status, mason = pcall(require, 'mason')
if not mason_status then return end
local lspconfig_status, lspconfig = pcall(require, 'mason-lspconfig')
if not lspconfig_status then return end

mason.setup {}

lspconfig.setup {
  automatic_installation = true,
}
