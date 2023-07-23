vim.g.loaded_netrw = 1                                                          -- Disable netrw due to race conditions with nvim-tree
vim.g.loaded_netrwPlugin = 1
vim.keymap.set('n', '<Leader>;', ':', { noremap = true })                       -- SPACE+; to get original cmdline mode, incase anything goes wrong with plugins

require('functions')
require('vars')
require('opts')
require('plugins')
require('theme')
require('keys')
require('autocmds')
require('plugins/lualine')
require('plugins/fsharp')
require('plugins/fugitive')
require('plugins/noice')
require('plugins/nvimtree')
require('plugins/ripgrep')
require('plugins/ruby')
require('plugins/scratch')
require('plugins/telescope')

