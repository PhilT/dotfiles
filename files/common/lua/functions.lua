function map(mode, lhs, rhs, opts)                                        -- Maps keys with noremap as a default
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function file_exist(filename)
  local file = io.open(filename, "r")
  if file == nil then return false else io.close(file) return true end
end

