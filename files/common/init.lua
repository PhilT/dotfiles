vim.g.loaded_netrw = 1                                                          -- Disable netrw due to race conditions with nvim-tree
vim.g.loaded_netrwPlugin = 1
vim.keymap.set('n', '<Leader>;', ':', { noremap = true })                       -- SPACE+; to get original cmdline mode, incase anything goes wrong with plugins

function ReloadConfig()
  for name,_ in pairs(package.loaded) do
    package.loaded[name] = nil
  end

  dofile(vim.env.MYVIMRC)
  vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
end

require('functions')
require('vars')
require('opts')
require('plugins')
require('theme')
require('keys')
require('autocmds')
require('plugins/lualine')
require('plugins/fugitive')
require('plugins/nvimtree')
require('plugins/purescript')
require('plugins/ripgrep')
require('plugins/ruby')
require('plugins/scratch')
require('plugins/telescope')
require('plugins/fsharp')
