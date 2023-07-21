require 'paq' {
  -- Core
  'neovim/nvim-lspconfig';                                                      -- Language server client settings
  'nvim-lua/plenary.nvim';                                                      -- Required by Telescope

  -- UI
  'christoomey/vim-tmux-navigator';                                             -- Move between vim and tmux panes seamlessly
  'nvim-lualine/lualine.nvim';                                                  -- Simple statusline
  'ap/vim-css-color';                                                           -- Color colors

  -- General
  'nvim-tree/nvim-tree.lua';                                                    -- CTRL+F to open File explorer
  {'nvim-telescope/telescope.nvim', branch = '0.1.x' };                         -- CTRL+P to open fuzzy file finder
  'nvim-telescope/telescope-fzy-native.nvim';

  'mtth/scratch.vim';                                                           -- go/gp - Edit/Preview Project scratchpad
  'jiangmiao/auto-pairs';                                                       -- ALT-n - Next bracket pair - Auto-pair brackets.
  'tpope/vim-surround';                                                         -- `cs'<q>` - change from single quotes to xml tags
  'tpope/vim-repeat';                                                           -- Repeat plugin commands such as surround with `.`
  'tpope/vim-dispatch';                                                         -- Run commands asynchronously using Neovim's jobstart()
  'stefandtw/quickfix-reflector.vim';                                           -- Global search and replace: Rg to search and add reaults to quickfix then edit quickfix and save to make changes to all files
  {                                                                             -- `<Leader>t` - Opens the project TODO.md file
    'dbeniamine/todo.txt-vim',
    url='https://gitlab.com/dbeniamine/todo.txt-vim'
  };
  'simeji/winresizer';                                                          -- `CTRL+E` - Resize windows with `hjkl`

  -- Version Control
  'tpope/vim-fugitive';                                                         -- Git plugin - :G for enhanced status

  -- Writing
  'plasticboy/vim-markdown';                                                    -- Markdown syntax highlighting and commands like adding a TOC

  -- General programming
  'editorconfig/editorconfig-vim';                                              -- Use a project's .editorconfig file for formatting
  'tpope/vim-abolish';                                                          -- Change word styles (e.g. Camelcase to underscore)
  --'SirVer/ultisnips';                                                           -- Handle snippets
  'nvim-lua/completion-nvim';                                                   -- Useful defaults to make completion work

  -- F#
  'PhilT/vim-fsharp';                                                           -- F# Syntax and Indent

  -- Vimscript
  'junegunn/vader.vim';                                                         -- Vimscript test framework
  'tpope/vim-scriptease';                                                       -- Some helpers for developing Vim plugins

  -- Ruby
  'slim-template/vim-slim';                                                     -- Slim templates syntax highlighting
}
