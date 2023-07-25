require'lspconfig'.purescriptls.setup {
  --on_attach = on_attach,
  settings = {
    purescript = {
      addSpagoSources = true -- e.g. any purescript language-server config here
    }
  },
  flags = {
    debounce_text_changes = 150,
  }
}
