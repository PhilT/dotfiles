local cmd = vim.cmd

cmd('set background=light')
cmd('colorscheme eink')


--local a = {}; for i=0,500 do a[i]=i+80 end                                      -- Grey out everything past 80 columns
--vim.opt.colorcolumn = table.concat(a, ',')
--vim.opt.colorcolumn = '81,82,83,84'
--cmd('highlight ColorColumn ctermbg=8')

vim.api.nvim_exec(                                                              -- Show full paths in lightline.vim statusline
[[
function! FilenameForLightline()
  return expand('%')
endfunction
]], false
)


vim.g.lightline = { 
  colorscheme = 'ayu_light',                                                   -- Set theme for lightline.vim
  component_function = { filename = 'FilenameForLightline' }                   -- Calls function to show full path name in statusline
}

