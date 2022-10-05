local group = vim.api.nvim_create_augroup('mygroup', { clear = true })
local autocmd = vim.api.nvim_create_autocmd

autocmd('BufReadPost', {                                                        -- Unmap ENTER in Quickfix so found files can be loaded 
  pattern = 'quickfix', 
  command = 'nnoremap <buffer> <CR> <CR>',
  group = group 
})
autocmd('Filetype', { pattern = 'qf', command = 'wincmd J', group = group })    -- Force quickfix window to open fullwidth at bottom
