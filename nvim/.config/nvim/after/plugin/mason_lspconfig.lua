local mason_lsp_status, mason_lsp = pcall(require, 'mason-lspconfig')
if not mason_lsp_status then return end

local lsp = require 'lspconfig'
local util = require 'lspconfig.util'
local ui = require 'lspconfig.ui.windows'
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local opts = { noremap = true, silent = true }

  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<leader>lf', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
end

ui.default_options.border = 'rounded'

mason_lsp.setup {
  automatic_installation = true,
  ensure_installed = {
    'astro',
    'cssls',
    'html',
    'lua_ls',
    'tailwindcss',
    'theme_check',
    'tsserver',
  },
}

mason_lsp.setup_handlers {
  function(server_name)
    lsp[server_name].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end,
  ['lua_ls'] = function()
    lsp.lua_ls.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
        },
      },
    }
  end,
  ['theme_check'] = function()
    lsp.theme_check.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      root_dir = util.root_pattern('.theme-check.yml', '.theme-check.yaml')
        or util.find_package_json_ancestor,
    }
  end,
}
