function map(mode, lhs, rhs, opts)                                        -- Maps keys with noremap as a default
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


