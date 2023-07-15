local cmd = vim.cmd

cmd.colorscheme('eink')

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

function set_theme(theme, statusline, todo_color, todo_weight)
  vim.opt.background = theme
  cmd.highlight({ 'Todo', 'cterm='..todo_weight, 'ctermbg=NONE', 'ctermfg='..todo_color })
  vim.g.lightline = { 
    colorscheme = statusline,                                                   -- Set theme for lightline.vim
    component_function = { filename = 'FilenameForLightline' }                  -- Calls function to show full path name in statusline
  }
  vim.fn['lightline#enable']()
end

function set_theme_dark()
  set_theme('dark', 'ayu_dark', 245, 'NONE')
end

function set_theme_light()
  set_theme('light', 'ayu_light', 240, 'bold')
end

set_theme_light()
