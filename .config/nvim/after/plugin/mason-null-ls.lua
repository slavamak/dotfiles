local null_ls_status, null_ls = pcall(require, 'mason-null-ls')
if not null_ls_status then return end

null_ls.setup {
  automatic_installation = true,
}

null_ls.setup_handlers {}
