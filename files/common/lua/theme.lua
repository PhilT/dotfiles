local cmd = vim.cmd

cmd.colorscheme('greyscale')
vim.opt.colorcolumn = '81,82,83,84,85'

function set_theme_dark()
  vim.opt.background = 'dark'
end

function set_theme_light()
  vim.opt.background = 'light'
end

set_theme_dark()

